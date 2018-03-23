//
//  DashboardViewController.swift
//  Template
//
//  Created by Erick on 13/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var lblExample: UILabel!
    @IBOutlet weak var btnAnimation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Animation
    
    func animation()
    {
        let theAnimation = CABasicAnimation(keyPath: "position");
        theAnimation.fromValue = CGPoint(x: UIScreen.main.bounds.size.width/2, y: self.btnAnimation.frame.origin.y)
        theAnimation.toValue = CGPoint(x: 100.0, y: 100.0)
        theAnimation.duration = 3.0;
        theAnimation.autoreverses = true //true - reverses into the initial value either smoothly or not
        theAnimation.repeatCount = 1
        btnAnimation.layer.add(theAnimation, forKey: "animatePosition")
    }
    

    //MARK: - IBAction
    
    @IBAction func buttonMap()
    {
        let mapVC = MapViewController(nibName: "MapViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @IBAction func buttonProfile()
    {
        let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @IBAction func buttonAnimation(_ sender: Any)
    {
        self.animation()
    }

}

extension UIButton{
    
    func moveBTN() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}
