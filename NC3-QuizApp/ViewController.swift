//
//  ViewController.swift
//  NC3-QuizApp
//
//  Created by Reyhan Rifqi on 07/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: Properties
    
    var success = true
    
    lazy var popUpWindow: PopUpWindow = {
        let view = PopUpWindow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.delegate = self
        return view
    }()

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var boxImage: UIImageView!
    @IBOutlet weak var playMusicButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionAbtn: UIButton!
    @IBOutlet weak var optionBbtn: UIButton!
    @IBOutlet weak var optionCbtn: UIButton!
    @IBOutlet weak var optionDbtn: UIButton!
    @IBOutlet weak var pointsLbl: UILabel!
    
    @IBOutlet weak var hint1Img: UIImageView!
    @IBOutlet weak var hint2Img: UIImageView!
    @IBOutlet weak var hint3Img: UIImageView!
        
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var hintLeft: Int?

    var index: Int?
    let ListOfQuestion: [question] = [
        question(question: "Who is the singer of the song?", correctAnswer: "Jason Mraz", optionA: "Jason Momoa", optionB: "Michael Jakson", optionC: "Jason Mraz", optionD: "Justin Timberlake", reward: 5),
        question(question: "What is the title of the song?", correctAnswer: "Celine Dion", optionA: "Celine Dion", optionB: "Demi Lovato", optionC: "Jessie J", optionD: "Taylor Swift", reward: 10)]
    var questions: question?
    
    var player: AVAudioPlayer!

    //MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPage(y: 1000)
        initUI()
        optionAbtn.layer.cornerRadius = 7
        optionBbtn.layer.cornerRadius = 7
        optionCbtn.layer.cornerRadius = 7
        optionDbtn.layer.cornerRadius = 7
        animateShow()

        
        hintLeft = 3
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func initUI(){
        self.questions = ListOfQuestion[index!]
        titleLbl.text = "Stage \(index!+1)"
        questionLabel.text = questions?.question
        optionAbtn.setTitle(questions?.optionA, for: .normal)
        optionBbtn.setTitle(questions?.optionB, for: .normal)
        optionCbtn.setTitle(questions?.optionC, for: .normal)
        optionDbtn.setTitle(questions?.optionD, for: .normal)
        pointsLbl.text = "\(data.integer(forKey: "Points"))"
    }
    
    func setupPage(y: CGFloat){
        titleLbl.center.y -= y
        boxImage.center.y -= y
        playMusicButton.center.y -= y
        
        questionLabel.center.y -= y
        optionAbtn.center.y -= y
        optionBbtn.center.y -= y
        optionCbtn.center.y -= y
        optionDbtn.center.y -= y
        
    }
    
    func animateShow(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveLinear, animations: {
            
            self.titleLbl.center.y += 1000
            self.boxImage.center.y += 1000
            self.playMusicButton.center.y += 1000
            
            self.questionLabel.center.y += 1000
            self.optionAbtn.center.y += 1000
            self.optionBbtn.center.y += 1000
            self.optionCbtn.center.y += 1000
            self.optionDbtn.center.y += 1000
        }, completion: nil)
        
    }
    
    func animateHide(){
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            
            self.titleLbl.center.y += 1000
            self.boxImage.center.y += 1000
            self.playMusicButton.center.y += 1000
            
            self.questionLabel.center.y += 1000
            self.optionAbtn.center.y += 1000
            self.optionBbtn.center.y += 1000
            self.optionCbtn.center.y += 1000
            self.optionDbtn.center.y += 1000
        }, completion: nil)
    }
    
    func playMusic(){
        let soundURL = Bundle.main.url(forResource: "bensound-ukulele", withExtension: "mp3")
        do{
            try player = AVAudioPlayer(contentsOf: soundURL!)
        }catch{
            print(error)
        }
        player?.play()
//        print(player?.duration)

    }
    
    func kuranginHint(){
        if hintLeft == 2{
            hint1Img.image = UIImage(named: "hint_off")
        }else if hintLeft == 1{
            hint1Img.image = UIImage(named: "hint_off")
            hint2Img.image = UIImage(named: "hint_off")
        }else if hintLeft == 0{
            hint1Img.image = UIImage(named: "hint_off")
            hint2Img.image = UIImage(named: "hint_off")
            hint3Img.image = UIImage(named: "hint_off")
        }
    }

    //MARK: ACTION

    @IBAction func answerFunction(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case questions?.correctAnswer:
            player?.stop()
            handleShowPopUp()
            
        default:
            hintLeft! -= 1
            kuranginHint()
            print("Salah")
        }
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        playMusic()
    }
    @objc func handleShowPopUp() {
        view.addSubview(popUpWindow)
        popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpWindow.heightAnchor.constraint(equalToConstant: 366).isActive = true
        popUpWindow.widthAnchor.constraint(equalToConstant: 282).isActive = true
        
        popUpWindow.showSuccessMessage = success
        success = !success
        
        popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpWindow.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 0.8
            self.popUpWindow.alpha = 1
            self.popUpWindow.transform = CGAffineTransform.identity
        }
    }
}

extension ViewController: PopUpDelegate{
    func handleDismissalYes() {
        print("Yes")
        let point = data.integer(forKey: "Points")
        data.set(point + questions!.reward, forKey: "Points")
        self.index! += 1
        animateHide()
        setupPage(y: 2000)
        animateShow()
        initUI()
        self.popUpWindow.removeFromSuperview()
        self.visualEffectView.alpha = 0

    }
    
    func handleDismissalNo() {
        print("No")
        self.popUpWindow.removeFromSuperview()
        self.visualEffectView.alpha = 0
        performSegue(withIdentifier: "toEndGame", sender: nil)

        
//        UIView.animate(withDuration: 0.5, animations: {
//            self.visualEffectView.alpha = 0
//            self.popUpWindow.alpha = 0
//            self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        }) { (_) in
//            self.popUpWindow.removeFromSuperview()
//            print("Did remove pop up window..")
//        }

    }
    
}
