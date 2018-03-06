//
//  RegisterViewController.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 12/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtMail : TextField!
    @IBOutlet weak var txtPassword : TextField!
    @IBOutlet weak var scrollMain : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setData()
    }
    
    //MARK: - Set Data
    
    private func setData()
    {
        txtMail.addViewContent(view: self.view, scroll: scrollMain)
        txtPassword.addViewContent(view: self.view, scroll: scrollMain)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollMain.contentSize = CGSize(width: UIScreen.main.bounds.width, height: self.scrollMain.frame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
    
    @IBAction func buttonRegister()
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
    }
    
    @IBAction func buttonBack()
    {
        self.navigationController?.popViewController(animated: true)
    }

}
