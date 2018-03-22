//
//  ProfileViewController.swift
//  Template
//
//  Created by Erick on 16/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var lblEmail : UILabel!
    @IBOutlet weak var lblUId : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
    
    @IBAction func buttonSingOff()
    {
        do{
            try Auth.auth().signOut()
            FBSDKLoginManager().logOut()
            let mainSlider = MainSliderViewController(nibName: "MainSliderViewController", bundle: Bundle.main)
            self.navigationController?.pushViewController(mainSlider, animated: true)
        }catch{
            let alertController = UIAlertController(title: "Error", message: "Se genero un error al cerrar sesión", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func buttonBack()
    {
        self.navigationController?.popViewController(animated: true)
    }
}
