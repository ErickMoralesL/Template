//
//  ObjectProperties.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 04/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class ObjectProperties: NSObject {

    func setLocalized(localizedKey:String) -> String
    {
        return NSLocalizedString(localizedKey, comment: "")
    }
    
}
