//
//  TextValidations.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 04/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class TextValidations: NSObject {

    public func validationForTypeAndField(formType: FormTypes, textField: TextField, isRequired: Bool) -> Bool
    {
        if (isRequired)
        {
            if(self.isEmpty(string: textField.text!))
            {
                self.returnFormValid(formErrorMessage: .FormErrorEmpty, txt:textField)
                return false;
                
            }else{
                
                //Validate form user name
                if(!self.validateWithRegex(formType: formType, string: textField.text!))
                {
                    self.returnFormValid(formErrorMessage: .FormErrorInvalid, txt: textField)
                    return false;
                }else{
                    
                    return true;
                }
            }
            
        }else{
            
            return true;
        }
    }
    
    private func isEmpty(string: String) -> Bool
    {
        if(string.count == 0 || string.elementsEqual(""))
        {
            return true;
        }else{
            return false;
        }
    }
    
    private func returnFormValid(formErrorMessage: FormErrorMessage, txt: TextField)
    {
        switch formErrorMessage
        {
        case .FormErrorEmpty:
            txt.showValidationError(errorMessage: ObjectProperties().setLocalized(localizedKey: "emptyField"))
            break
        case .FormErrorInvalid:
            txt.showValidationError(errorMessage: ObjectProperties().setLocalized(localizedKey: "emptyIncorrect"))
            break
        case .FormMailValid:
            txt.showValidationError(errorMessage: ObjectProperties().setLocalized(localizedKey: "mailIncorrect"))
            break
        case .FormPassword:
            txt.showValidationError(errorMessage: ObjectProperties().setLocalized(localizedKey: "passwordIncorrect"))
            break
        case .FormValid:
            print("Success")
            break
        default:
            break
        }
    }

    private func validateWithRegex(formType: FormTypes, string:String) -> Bool
    {
        var regex: NSRegularExpression? = nil
    
        switch (formType) {
        case .FormTypeUserName:
            regex = try! NSRegularExpression(pattern: RGX_ALPHA, options: [])
            break
        case .FormTypeNumbers :
            regex = try! NSRegularExpression(pattern: RGX_NUMBERS, options: [])
            break
        case .FormTypeEmail:
            regex = try! NSRegularExpression(pattern: RGX_EMAIL, options: [])
            break
        case .FormTypePassword:
            regex = try! NSRegularExpression(pattern: RGX_EASYPASS, options: [])
            break
        case .FormTypeAlphanumeric:
            regex = try! NSRegularExpression(pattern: RGX_ALPHANUMERIC, options: [])
            break
        case .FormTypeDate:
            regex = try! NSRegularExpression(pattern: RGX_DATE, options: [])
        default:
            break
        }
        
        
        let numberOfMatches: NSInteger!
        numberOfMatches = regex?.numberOfMatches(in: string, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: string.count))
        
        if (numberOfMatches == 0)
        {
            return false
        }else{
            return true
        }

    }
    
}
