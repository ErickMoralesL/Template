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

class MainSliderViewController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate, FireBaseDelegate, ButtonSocialNetWorkDelegate, AppDelegateGoogleDelegate {
    
    @IBOutlet weak var btnLoginEmail: UIButton!
    @IBOutlet weak var btnRegisterEmail: UIButton!
    
    var loginButtonFacebook : FBSDKLoginButton!
    var logInButtonTwitter : UIButton!
    var loginButtonGoogle : UIView!
    var fireBaseClass = FireBaseClass()
    
    var buttonSocial = ButtonSocialNetworks()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fireBaseClass.delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signIn()
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.delegate = self
        
        buttonSocial.delgate = self
        
    }
    
    //MARL: - View Will Appear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let when = DispatchTime.now() + 0// change 3 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.loginButtonFacebook = self.buttonSocial.buttonLoginFacebook(topButton: self.btnRegisterEmail, view: self.view) as! FBSDKLoginButton
            self.loginButtonFacebook.delegate = self
            self.logInButtonTwitter = self.buttonSocial.buttonLoginTwitter(topButton: self.loginButtonFacebook, view: self.view)
            self.loginButtonGoogle = self.buttonSocial.buttonLoginGoogle(topButton: self.logInButtonTwitter, view: self.view)
            
            self.view.reloadInputViews()
        }
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
    
    func onError(fireBaseType: FireBaseType, errorDescription: String) {
        if fireBaseType == .FireBaseLoginCredential
        {
            self.alertError()
        }
    }
    
    //MARK: - AppDelegate Delagate
    
    func signSucces(user: GIDGoogleUser!, error: Error?) {
        
        if let error = error {
            print("\(error)")
            self.alertError()
            return
        }

        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        fireBaseClass.login(credential: credential)
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
