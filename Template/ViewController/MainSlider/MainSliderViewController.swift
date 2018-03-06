//
//  MainSliderViewController.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 11/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class MainSliderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: IBAction
    
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
