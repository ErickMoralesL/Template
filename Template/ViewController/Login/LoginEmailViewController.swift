//
//  LoginEmailViewController.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 11/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class LoginEmailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMail: TextField!
    @IBOutlet weak var txtPassword: TextField!
    
    @IBOutlet weak var mainScroll: UIScrollView!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setData()
    }

    //MARK: Set Data
    
    func setData()
    {
        txtMail.addViewContent(view: self.view, scroll: mainScroll)
        txtPassword.addViewContent(view: self.view, scroll: mainScroll)
    }


    override func viewWillLayoutSubviews()
    {
        mainScroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: mainScroll.frame.size.height)
    }
    
    //MARK: IBAction
    
    @IBAction func buttonBack()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonLogin()
    {
        let isMail: Bool = TextValidations().validationForTypeAndField(formType: .FormTypeEmail, textField: txtMail, isRequired: true)
        
        let isPassword: Bool = TextValidations().validationForTypeAndField(formType: .FormTypePassword, textField: txtPassword, isRequired: true)
        
        if !isMail
        {
            return
        }
        
        if !isPassword
        {
            return
        }
        
        print("Login");
    }
    
    @IBAction func buttonRegister()
    {
        let registerVC = RegisterViewController(nibName: "RegisterViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

}