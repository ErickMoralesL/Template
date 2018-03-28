//
//  RegisterViewController.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 12/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController, FireBaseDelegate {

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

    //MARK: - View Will Layout Subviews
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollMain.contentSize = CGSize(width: UIScreen.main.bounds.width, height: self.scrollMain.frame.size.height)
    }
    
    //MARK: - Fire Base Delegate
    
    func onSuccess(fireBaseType: FireBaseType) {
        
        SVProgressHUD.dismiss()
        
        if(fireBaseType == .FireBaseRegister)
        {
            let mainSliderVC = DashboardViewController(nibName: "DashboardViewController", bundle: Bundle.main)
            let transition = CATransition()
            transition.duration = 2
            transition.type = kCATransitionFade
            self.navigationController?.view.layer.add(transition, forKey: kCATransition)
            
            self.navigationController?.pushViewController(mainSliderVC, animated: false)
        }
    }
    
    func onError(fireBaseType: FireBaseType, errorDescription: String) {
        
        SVProgressHUD.dismiss()
        
        if(fireBaseType == .FireBaseRegister)
        {
            let alertController = UIAlertController(title: "Error", message: "Se genero un error al registrar al usuario", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
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
        
        SVProgressHUD.show()
        let fireBaseClass = FireBaseClass()
        fireBaseClass.delegate = self
        fireBaseClass.registerUserMail(name: txtMail.text!, password: txtPassword.text!)
    }
    
    @IBAction func buttonBack()
    {
        self.navigationController?.popViewController(animated: true)
    }

}
