package yal.arbre.expressions;

public class ConstanteEntiere extends Constante {
    
    public ConstanteEntiere(String texte, int n) {
        super(texte, n) ;
    }

    @Override
    public String toMIPS() {
        return  "\n\t# Integer Constant '"+this.cste+"':\n"+
                "\tli $v0, "+this.cste+"\n"
                ;
    }

    @Override
    public boolean isConst() { return true; }
}
