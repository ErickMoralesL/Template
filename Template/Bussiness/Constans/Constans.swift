//
//  Constans.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 04/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import Foundation

//MARK: - Regex

let RGX_ALPHANUMERIC = "^[a-zA-Z0-9áéíóú]*$"
let RGX_NUMBERS = "^([0-9]+)?(\\.([0-9]{1,2})?)?$"
let RGX_EMAIL = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
let RGX_EASYPASS = "(.{8,100})"
let RGX_HARDPASS = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,100})"
let RGX_ALPHA = "^[a-zA-ZÀ-ÿ\\s']+$"
let RGX_DATE = "(^(((0[1-9]|1[0-9]|2[0-8])[\\/](0[1-9]|1[012]))|((29|30|31)[\\/](0[13578]|1[02]))|((29|30)[\\/](0[4,6,9]|11)))[\\/](19|[2-9][0-9])\\d\\d$)|(^29[\\/]02[\\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)"

//MARK: - FormTypes and Validations

enum FormTypes {
    case FormTypeUserName
    case FormTypeEmail
    case FormTypePassword
    case FormTypeNumbers
    case FormTypeDate
    case FormTypeZipCode
    case FormTypeAlphanumeric
    case FormPhone3
    case FormPhone4
}

enum FormErrorMessage {
    case FormErrorEmpty
    case FormErrorInvalid
    case FormMailValid
    case FormValid
    case FormPassword
}
