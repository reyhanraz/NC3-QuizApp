//
//  HowToPlayVC.swift
//  NC3-QuizApp
//
//  Created by Feidora Nadia Putri on 15/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit

class HowToPlayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
  func hideNavigationBar() {
      self.navigationController?.setNavigationBarHidden(true, animated: true)
  }

    @IBAction func btnStartPressed(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers ;
        for aViewController in viewControllers {
            if(aViewController is LandingVCViewController){
               self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
    }
}
