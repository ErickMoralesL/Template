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
    @IBOutlet weak var btnMap: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var lblTemplate: UILabel!
    @IBOutlet weak var btnHello: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        Animations().translation(view: self.btnAnimation,finalPosition: CGPoint(x: 180, y: 100))
        Animations().translationPath(view: lblExample, pathArray: [CGPoint(x: UIScreen.main.bounds.size.width/2, y: 100), CGPoint(x: 100, y: 100), CGPoint(x:300, y: 300)])
        Animations().exampleThree(view: btnMap)
        Animations().exampleFour(view: lblTemplate)
        Animations().exampleFive(view: btnHello)
    }
    
    @IBAction func helloWorld()
    {
        print("Hola Mundo")
        Animations().exampleSix(view: self.view,label: lblExample)
    }

}
