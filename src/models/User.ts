export default class User{
    private idUser : number;
    private nom: string | null;
    private prenom: string |null;

    constructor(id: number, name ? : string, firstname ? : string){
        this.idUser = id;
        this.nom = (name === undefined) ? null : name;
        this.prenom = (firstname === undefined) ? null : firstname;
    }

    


}