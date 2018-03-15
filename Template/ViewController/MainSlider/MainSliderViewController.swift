//
//  MainSliderViewController.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 11/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import TwitterKit
import GoogleSignIn

class MainSliderViewController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var btnLoginEmail: UIButton!
    @IBOutlet weak var btnRegisterEmail: UIButton!
    
    var loginButtonFacebook : FBSDKLoginButton!
    var logInButtonTwitter : UIButton!
    var loginButtonGoogle : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signIn()
        
        loginButtonFacebook = ButtonSocialNetworks().buttonLoginFacebook(topButton: btnRegisterEmail, view: self.view) as! FBSDKLoginButton
        loginButtonFacebook.delegate = self
        logInButtonTwitter = ButtonSocialNetworks().buttonLoginTwitter(topButton: loginButtonFacebook, view: self.view)
        loginButtonGoogle = ButtonSocialNetworks().buttonLoginGoogle(topButton: logInButtonTwitter, view: self.view)
    }

    //MARK: - Facebook Button Delegate
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        let dashboardVC = DashboardViewController(nibName: "DashboardViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!)
    {
        
    }
    
    //MARK: - IBAction
    
    @IBAction func buttonLoginEmail()
    {
        let loginEmailVC = LoginEmailViewController(nibName: "LoginEmailViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(loginEmailVC, animated: true)
    }
    
    @IBAction func buttonRegisterEmail()
    {
        let registerVC = RegisterViewController(nibName: "RegisterViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

}
