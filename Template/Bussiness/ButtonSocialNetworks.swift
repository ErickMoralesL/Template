//
//  ButtonSocialNetworks.swift
//  Template
//
//  Created by Erick on 13/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import TwitterKit
import GoogleSignIn
import FirebaseAuth

protocol ButtonSocialNetWorkDelegate {
    func onSuccessTwitter();
    func onErrorTwitter();
}

class ButtonSocialNetworks: NSObject, FireBaseDelegate {
    
    var delgate: ButtonSocialNetWorkDelegate?
    
    //Mark: - Button Facebook
    public func buttonLoginFacebook(topButton: UIButton, view: UIView) -> UIButton
    {
        // Do any additional setup after loading the view. 
        let loginButtonFacebook = FBSDKLoginButton()
        // loginButton.center = self.view.center
        loginButtonFacebook.frame = CGRect(x: topButton.frame.origin.x, y: topButton.frame.origin.y + topButton.frame.size.height + 20, width: topButton.frame.size.width, height: topButton.frame.size.height)
        view.addSubview(loginButtonFacebook)
        
        return loginButtonFacebook
    }
    
    //Mark: - Button Twitter
    public func buttonLoginTwitter(topButton: UIButton, view: UIView) -> UIButton
    {
        let fireBaseClass = FireBaseClass()
        fireBaseClass.delegate = self
        
       let logInButtonTwitter = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))");
                let credential = TwitterAuthProvider.credential(withToken: (session?.authToken)!, secret: (session?.authTokenSecret)!)
                fireBaseClass.login(credential: credential)
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
                self.delgate?.onErrorTwitter()
            }
        })
        //logInButtonTwitter.center = self.view.center
        logInButtonTwitter.frame = CGRect(x: topButton.frame.origin.x, y: topButton.frame.origin.y + topButton.frame.size.height + 20, width: topButton.frame.size.width, height: topButton.frame.size.height)
        view.addSubview(logInButtonTwitter)
        
        return logInButtonTwitter
    }
    
    //MARK: - Button Google
    public func buttonLoginGoogle(topButton: UIButton, view: UIView) -> UIView
    {
        //GIDSignIn.sharedInstance().uiDelegate = self
        let loginButtonGoogle = GIDSignInButton()
        loginButtonGoogle.frame = CGRect(x: topButton.frame.origin.x, y: topButton.frame.origin.y + topButton.frame.size.height + 20, width: topButton.frame.size.width, height: topButton.frame.size.height)
        view.addSubview(loginButtonGoogle)
        
        return loginButtonGoogle
    }
    
    //MARK: - FireBase Delegate
    
    func onSuccess(fireBaseType: FireBaseType) {
        if(fireBaseType == .FireBaseLoginCredential)
        {
            self.delgate?.onSuccessTwitter()
        }
    }
    
    func onError(fireBaseType: FireBaseType, errorDescription: String) {
        if(fireBaseType == .FireBaseLoginCredential)
        {
            self.delgate?.onErrorTwitter()
        }
    }

}
