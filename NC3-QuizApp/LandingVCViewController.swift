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
    @IBOutlet weak var soundBtn: UIButton!
    
    @IBOutlet var EditProfilePopup: UIView!
    
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var musicNoteImg: UIImageView!
    
    @IBOutlet weak var userNameTxtfld: UITextField!
    
    @IBOutlet weak var avatar1Btn: UIButton!
    @IBOutlet weak var avatar2Btn: UIButton!
    @IBOutlet weak var avatar3Btn: UIButton!
    @IBOutlet weak var avatar4Btn: UIButton!
    @IBOutlet weak var avatar5Btn: UIButton!
    @IBOutlet weak var avatar6Btn: UIButton!
    
    var profileImgChosen = ""
    

    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    
        UIView.animate(withDuration: 1, delay: 1, options: [.beginFromCurrentState, .repeat], animations: {
            self.musicNoteImg.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2/5)
        }, completion: nil)
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
        EditProfilePopup.alpha = 0
        
        soundBtn.setImage(UIImage(named: "mute_button"), for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pointsLbl.text = "\(data.integer(forKey: "Points"))"
        playSoundLoop(title: "Home Screen Backsound")
        
        if !Core.shared.isNewUser(){
            stopMusic()
            let storyBoard = UIStoryboard(name: "Onboarding", bundle: nil)
            let mainViewController = storyBoard.instantiateViewController(withIdentifier: "OnBoard")
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }

    }
    
    @IBAction func EditProfile(_ sender: Any) {
        EditProfilePopup.center = self.view.center
        EditProfilePopup.layer.cornerRadius = 7
        EditProfilePopup.layer.borderColor = UIColor.white.cgColor
        EditProfilePopup.layer.borderWidth = 2
        self.view.addSubview(EditProfilePopup)
        userNameTxtfld.text = data.string(forKey: "userName")

        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 0.9
            self.EditProfilePopup.alpha = 1
            self.EditProfilePopup.transform = CGAffineTransform.identity
            self.EditProfilePopup.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }
    }
    
    @IBAction func toGamePlay(_ sender: UIButton) {
        stopMusic()
        performSegue(withIdentifier: "toGamePlay", sender: nil)
    }
    
    
    @IBAction func pictureClicked(_ sender: UIButton) {
        sender.layer.cornerRadius = 22
        sender.layer.borderColor = UIColor.blue.cgColor
        switch sender{
        case avatar1Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
            self.profileImgChosen = "avatar_1.png"
        case avatar2Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
            self.profileImgChosen = "avatar_2.png"
        case avatar3Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
            self.profileImgChosen = "avatar_3.png"
        case avatar4Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
            self.profileImgChosen = "avatar_4.png"
        case avatar4Btn:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
            self.profileImgChosen = "avatar_5.png"
        default:
            resetAvatarBtn()
            sender.layer.borderWidth = 2
            self.profileImgChosen = "avatar_6.png"
        }
    }
    @IBAction func saveBtnClicked(_ sender: UIButton) {
        if userNameTxtfld.text != ""{
            data.set(userNameTxtfld.text, forKey: "userName")
            data.set(self.profileImgChosen, forKey: "ProfileImage")
        }
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 0
            self.EditProfilePopup.alpha = 0
            self.EditProfilePopup.transform = CGAffineTransform.identity
            self.EditProfilePopup.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }

        //
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
    
    @IBAction func dismissEditProfile(_ sender: Any) {
        //EditProfilePopup.removeFromSuperview()
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 0
            self.EditProfilePopup.alpha = 0
            self.EditProfilePopup.transform = CGAffineTransform.identity
            self.EditProfilePopup.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }
    }
    @IBAction func soundBtnPressed(_ sender: UIButton) {
        switch sender.currentImage {
        case UIImage(named: "mute_button"):
            soundBtn.setImage(UIImage(named: "unmute_button"), for: .normal)
            soundMute()
        default:
            soundBtn.setImage(UIImage(named: "mute_button"), for: .normal)
            soundUnMute()
        }
        
    }
    
}

class Core{
    static let shared = Core()
    
    func isNewUser()->Bool{
        return data.bool(forKey: "firstUser")
    }
    
    func setIsnotnewUser(){
        data.set(true, forKey: "firstUser")
    }
    
    
    
}
