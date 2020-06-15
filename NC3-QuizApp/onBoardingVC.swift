//
//  onBoardingVC.swift
//  NC3-QuizApp
//
//  Created by Reyhan Rifqi on 13/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit

class onBoardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnStartPressed(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers ;
        for aViewController in viewControllers {
            if(aViewController is LandingVCViewController){
               self.navigationController!.popToViewController(aViewController, animated: true);
                Core.shared.setIsnotnewUser()
            }
        }
    }

}
