export class EmailValidation {

    public static validateEmail(email : string) {
        const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
    
    public static validate(email: string) {
        if (EmailValidation.validateEmail(email)) {
            return email + " is valid :)";
        } else {
            return email + " is not valid :(";
        }
    }
}