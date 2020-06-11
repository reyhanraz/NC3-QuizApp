//
//  LandingVCViewController.swift
//  NC3-QuizApp
//
//  Created by Reyhan Rifqi on 07/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit


let data = UserDefaults.standard

class LandingVCViewController: UIViewController {
    

    @IBOutlet weak var pointsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        pointsLbl.text = "\(data.integer(forKey: "Points"))"

        
    }
    
    
    @IBAction func toGamePlay(_ sender: UIButton) {
        performSegue(withIdentifier: "toGamePlay", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController{
            destination.index = 0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
