"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.EmailValidation = void 0;
class EmailValidation {
    static validateEmail(email) {
        const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
    static validate(email) {
        if (EmailValidation.validateEmail(email)) {
            return email + " is valid :)";
        }
        else {
            return email + " is not valid :(";
        }
    }
}
exports.EmailValidation = EmailValidation;
