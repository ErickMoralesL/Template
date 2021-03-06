//
//  FireBaseClass.swift
//  Template
//
//  Created by Erick on 12/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

protocol FireBaseDelegate {
    func onSuccess(fireBaseType: FireBaseType)
    func onError(fireBaseType: FireBaseType,errorDescription: String)
}

class FireBaseClass: NSObject {

    var delegate: FireBaseDelegate?
    
    public func registerUserMail (name: String, password: String)
    {
        Auth.auth().createUser(withEmail: name, password: password) { (user, error) in
            if error == nil
            {
                self.delegate?.onSuccess(fireBaseType: FireBaseType.FireBaseRegister)
            }else{
                self.delegate?.onError(fireBaseType: FireBaseType.FireBaseRegister, errorDescription: (error?.localizedDescription)!)
            }
        }
    }
    
    public func login (name: String, password: String)
    {
        Auth.auth().signIn(withEmail: name, password: password) { (user, error) in
            if error == nil
            {
                self.delegate?.onSuccess(fireBaseType: FireBaseType.FireBaseLogin)
            }else{
                self.delegate?.onError(fireBaseType: FireBaseType.FireBaseLogin, errorDescription: (error?.localizedDescription)!)
            }
        }
    }
    
    public func login (credential: AuthCredential)
    {
        Auth.auth().signIn(with: credential) { (user, error) in
            if error == nil
            {
                self.delegate?.onSuccess(fireBaseType: FireBaseType.FireBaseLoginCredential)
            }else{
                self.delegate?.onError(fireBaseType: FireBaseType.FireBaseLoginCredential, errorDescription:  (error?.localizedDescription)!)
            }
        }
    }
}
