package yal.arbre.instructions;

import yal.arbre.expressions.Variable;
import yal.declaration.TDS;
import yal.declaration.symbols.Symbole;

public class Lire extends Instruction
{
    private Variable idf;

    public Lire(Variable idf, int n)
    {
        super(n);
        this.idf = idf;
    }

    @Override
    public void verifier()
    {
        idf.verifier();
        // TODO: verify read array, read array element and read function
    }

    @Override
    public String toMIPS()
    {
        Symbole s = TDS.Instance().Identify(idf.getEntree());
        int offset = -4 * s.getOffset();

        String mips = "\n\t# Reads an integer: ";
        mips += "\n\tli $v0, 5\n" +
                "\tsyscall\n" +
                "\n\t# Get adress of the variable '"+idf.getEntree().getIdentifier()+"':\n"+
                "\tli $t2, "+s.getNoBloc()+"\n"+
                "\tjal search_var\n"+
                "\tsw $v0, "+offset+"($t1)\n"
        ;
        return mips;
    }
}
