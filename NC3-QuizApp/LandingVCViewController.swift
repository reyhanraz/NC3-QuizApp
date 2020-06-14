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
    
    @IBOutlet var EditProfilePopup: UIView!
    
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var musicNoteImg: UIImageView!
    
    @IBOutlet weak var avatar1Btn: UIButton!
    @IBOutlet weak var avatar2Btn: UIButton!
    @IBOutlet weak var avatar3Btn: UIButton!
    @IBOutlet weak var avatar4Btn: UIButton!
    @IBOutlet weak var avatar5Btn: UIButton!
    @IBOutlet weak var avatar6Btn: UIButton!

    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        pointsLbl.text = "\(data.integer(forKey: "Points"))"
    
        UIView.animate(withDuration: 1, delay: 1, options: [.beginFromCurrentState, .repeat], animations: {
            self.musicNoteImg.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2/5)
        }, completion: nil)
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0

        
    }
    
    @IBAction func EditProfile(_ sender: Any) {
        EditProfilePopup.center = self.view.center
        EditProfilePopup.layer.cornerRadius = 7
        EditProfilePopup.layer.borderColor = UIColor.white.cgColor
        EditProfilePopup.layer.borderWidth = 2
        visualEffectView.alpha = 0.8
        self.view.addSubview(EditProfilePopup)
    }
    
    @IBAction func toGamePlay(_ sender: UIButton) {
        performSegue(withIdentifier: "toGamePlay", sender: nil)
    }
    
    
    @IBAction func pictureClicked(_ sender: UIButton) {
        sender.layer.cornerRadius = 22
        sender.layer.borderColor = UIColor.blue.cgColor
        switch sender{
        case avatar1Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
        case avatar2Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
        case avatar3Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
        case avatar4Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
        case avatar4Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
        default:
            resetAvatarBtn()
            sender.layer.borderWidth = 2

        }
        
        
    }
    
    func resetAvatarBtn(){
        avatar1Btn.layer.borderWidth = 0
        avatar2Btn.layer.borderWidth = 0
        avatar3Btn.layer.borderWidth = 0
        avatar4Btn.layer.borderWidth = 0
        avatar5Btn.layer.borderWidth = 0
        avatar6Btn.layer.borderWidth = 0
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
