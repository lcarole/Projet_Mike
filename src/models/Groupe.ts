export default class Groupe{
    private nom : string | null;
    private idGroupe : number;
    private idCreateur : number | null;

    constructor(idG: number, name ? : string,idUser ? : number ){
        this.idGroupe = idG;
        this.nom = (name === undefined ) ? null : name;
        this.idCreateur = idUser;
    }

}