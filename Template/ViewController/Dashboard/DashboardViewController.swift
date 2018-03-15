//
//  DashboardViewController.swift
//  Template
//
//  Created by Erick on 13/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

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

}
