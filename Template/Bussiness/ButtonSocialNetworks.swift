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

class ButtonSocialNetworks: NSObject {
    
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
       let logInButtonTwitter = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))");
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
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

}
