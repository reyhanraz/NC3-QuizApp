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

    
}
