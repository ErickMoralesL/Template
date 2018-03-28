//
//  ViewController.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 11/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import SVProgressHUD
import GoogleSignIn
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        #if DEVELOPMENT
            let estado = "Desarrollo"
        #else
            let estado = "Produccion"
        #endif
        
        print(estado)
        
        SVProgressHUD.show()
        // Creat Delay
        
        let when = DispatchTime.now() + 1 // change 3 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            if Auth.auth().currentUser != nil {
                // User is signed in.
                // ...
                let mainSliderVC = DashboardViewController(nibName: "DashboardViewController", bundle: Bundle.main)
                self.onTrasition(viewController: mainSliderVC)
            } else {
                // No user is signed in.
                // ...
                let mainSliderVC = MainSliderViewController(nibName: "MainSliderViewController", bundle: Bundle.main)
                self.onTrasition(viewController: mainSliderVC)
            }
        }
    }
    
    private func onTrasition(viewController: UIViewController){
        let transition = CATransition()
        transition.duration = 2
        transition.type = kCATransitionFade
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        
        SVProgressHUD.dismiss()
        
        self.navigationController?.pushViewController(viewController, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

