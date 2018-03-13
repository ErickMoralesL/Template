//
//  FireBaseClass.swift
//  Template
//
//  Created by Erick on 12/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Firebase

protocol FireBaseDelegate {
    func onSuccess()
    func onError()
}

class FireBaseClass: NSObject {

    var delegate: FireBaseDelegate?
    
    public func registerUserMail (name: String, password: String)
    {
        Auth.auth().createUser(withEmail: name, password: password) { (user, error) in
            if error == nil
            {
                self.delegate?.onSuccess()
            }else{
                self.delegate?.onError()
            }
        }
    }
    
}
