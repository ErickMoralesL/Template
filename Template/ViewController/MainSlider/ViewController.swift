//
//  ViewController.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 11/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        SVProgressHUD.show()
        // Creat Delay
        
        let when = DispatchTime.now() + 2 // change 3 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            
            let mainSliderVC = MainSliderViewController(nibName: "MainSliderViewController", bundle: Bundle.main)
            // Por buenas practicas.
            let transition = CATransition()
            transition.duration = 2
            transition.type = kCATransitionFade
            self.navigationController?.view.layer.add(transition, forKey: kCATransition)
            
            SVProgressHUD.dismiss()
            
            self.navigationController?.pushViewController(mainSliderVC, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

