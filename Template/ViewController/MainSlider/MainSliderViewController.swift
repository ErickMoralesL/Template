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
import FirebaseAuth

class MainSliderViewController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate, FireBaseDelegate, ButtonSocialNetWorkDelegate {
    
    @IBOutlet weak var btnLoginEmail: UIButton!
    @IBOutlet weak var btnRegisterEmail: UIButton!
    
    var loginButtonFacebook : FBSDKLoginButton!
    var logInButtonTwitter : UIButton!
    var loginButtonGoogle : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signIn()
        
        let buttonSocial = ButtonSocialNetworks()
        
        buttonSocial.delgate = self
        loginButtonFacebook = buttonSocial.buttonLoginFacebook(topButton: btnRegisterEmail, view: self.view) as! FBSDKLoginButton
        loginButtonFacebook.delegate = self
        logInButtonTwitter = buttonSocial.buttonLoginTwitter(topButton: loginButtonFacebook, view: self.view)
        loginButtonGoogle = buttonSocial.buttonLoginGoogle(topButton: logInButtonTwitter, view: self.view)
    }
    
    //MARK: - Button Social NetWork Delegate
    
    func onSuccessTwitter() {
        self.navigation()
    }
    
    func onErrorTwitter() {
        self.alertError()
    }

    //MARK: - Facebook Button Delegate
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if let error = error{
            print("Failed to login: \(error.localizedDescription)")
            return
        }
        
        guard let accessToken = FBSDKAccessToken.current() else {
            print("Faild to get access Token")
            return
        }
        
        let credentiales = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
        
        let fireBaseClass = FireBaseClass()
        fireBaseClass.delegate = self
        fireBaseClass.login(credential: credentiales)
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!)
    {
        
    }
    
    //MARK: - FireBase Class Delegate
    func onSuccess(fireBaseType: FireBaseType) {
        if fireBaseType == .FireBaseLoginCredential
        {
            self.navigation()
        }
    }
    
    func onError(fireBaseType: FireBaseType) {
        if fireBaseType == .FireBaseLoginCredential
        {
            self.alertError()
        }
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

    //MARK: NAvigation
    
    private func navigation()
    {
        let dashboardVC = DashboardViewController(nibName: "DashboardViewController", bundle: Bundle.main)
        // let navigation = UINavigationController(rootViewController: dashboardVC);
        // UIApplication.shared.keyWindow?.rootViewController = navigation
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
    private func alertError()
    {
        let alertController = UIAlertController(title: "Error de Login", message: "Error al ingresar", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
