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
    
    var state = true
    var buttonArray: [UIButton] = []
    
    lazy var popUpWindow: PopUpWindow = {
        let view = PopUpWindow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.delegate = self
        return view
    }()
    
    lazy var popUpWindowForWrong: PopUpWindowForWrong = {
        let view = PopUpWindowForWrong()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.delegate = self
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ListOfQuestion: [question] = [
        question(question: "Who is the singer of this song?", questionSong: "stage_1", questionFact: "My Heart Will Go On in Titanic\nmovie is a demo track and\nrecorded in just one take.  ", factImage: "stage_1.png", correctAnswer: "Celine Dion", optionA: "Mariah Carey", optionB: "Celine Dion", optionC: "Whitney Houston", optionD: "Beyonce", reward: 10),
        question(question: "Which vocal group sings this song?", questionSong: "stage_2", questionFact: "The music video reaches #1 on\nMTV Total Request Live for 25\nstraight days.", factImage: "stage_2.png", correctAnswer: "NSYNC", optionA: "NSYNC", optionB: "Westlife", optionC: "Backstreet Boys", optionD: "Boyz II Men", reward: 30),
        question(question: "What is the title of this song?", questionSong: "stage_3", questionFact: "This song is a retelling of the\nFrench revolution and the death\nof King Louis XVI.", factImage: "stage_3.png", correctAnswer: "Viva La Vida", optionA: "Cyclone", optionB: "Damaged", optionC: "Yellow", optionD: "Viva La Vida", reward: 60),
        question(question: "How many personnel in a group sing the song 'Dancing Queen'?", questionSong: "stage_4", questionFact: "ABBA were all certain that\nDancing Queen would be a hit.", factImage: "stage_4.png", correctAnswer: "4 personnel", optionA: "6 personnel", optionB: "5 personnel", optionC: "4 personnel", optionD: "3 personnel", reward: 100),
        question(question: "This is a song by Michael Jackson, in what year was this song released?", questionSong: "stage_5", questionFact: "One Day in Your Life became\nnumber one in the UK for two\nweeks in June and July 1981.", factImage: "stage_5.png", correctAnswer: "1980s", optionA: "2010s", optionB: "2000s", optionC: "1990s", optionD: "1980s", reward: 150)]

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var boxImage: UIImageView!
    @IBOutlet weak var playMusicButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionAbtn: UIButton!
    @IBOutlet weak var optionBbtn: UIButton!
    @IBOutlet weak var optionCbtn: UIButton!
    @IBOutlet weak var optionDbtn: UIButton!
    @IBOutlet weak var pointsLbl: UILabel!
    
    @IBOutlet weak var hint1Img: UIButton!
    @IBOutlet weak var hint2Img: UIButton!
    @IBOutlet weak var hint3Img: UIButton!
        
    var pointsGained = 0
    var hintLeft: Int?

    var index: Int?
    
    var questions: question?
    
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
        if index! < ListOfQuestion.count{
            self.questions = ListOfQuestion[index!]
            titleLbl.text = "Stage \(index!+1)"
            questionLabel.text = questions?.question
            optionAbtn.setTitle(questions?.optionA, for: .normal)
            optionBbtn.setTitle(questions?.optionB, for: .normal)
            optionCbtn.setTitle(questions?.optionC, for: .normal)
            optionDbtn.setTitle(questions?.optionD, for: .normal)
            pointsLbl.text = "\(data.integer(forKey: "Points"))"
            
            buttonArray = [optionAbtn, optionBbtn, optionCbtn, optionDbtn]
            
            resetButtonOption()
            
            optionAbtn.isHidden = false
            optionBbtn.isHidden = false
            optionCbtn.isHidden = false
            optionDbtn.isHidden = false

            hint1Img.isEnabled = true
            hint2Img.isEnabled = true
            hint3Img.isEnabled = true
        }else{
            performSegue(withIdentifier: "toEndGame", sender: self)
        }
        
        
        
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
    
    func kuranginHint(){
        if hintLeft == 2{
            hint1Img.setImage(UIImage(named: "hint_off"), for: .normal)
            hint1Img.isEnabled = false
        }else if hintLeft == 1{
            hint1Img.setImage(UIImage(named: "hint_off"), for: .normal)
            hint2Img.setImage(UIImage(named: "hint_off"), for: .normal)
            hint1Img.isEnabled = false
            hint2Img.isEnabled = false
        }else if hintLeft == 0{
            hint1Img.setImage(UIImage(named: "hint_off"), for: .normal)
            hint2Img.setImage(UIImage(named: "hint_off"), for: .normal)
            hint3Img.setImage(UIImage(named: "hint_off"), for: .normal)
            hint1Img.isEnabled = false
            hint2Img.isEnabled = false
            hint3Img.isEnabled = false
        }
        
        buttonArray.removeAll(where: {$0.titleLabel?.text == questions?.correctAnswer})
        print(buttonArray)
        buttonArray.randomElement()?.isHidden = true
        buttonArray.randomElement()?.isHidden = true
        
    }

    //MARK: ACTION

    @IBAction func answerFunction(_ sender: UIButton) {
        let color = UIColor(displayP3Red: 255/255, green: 154/255, blue: 74/255, alpha: 1)
        
        switch sender{
        case optionAbtn:
            resetButtonOption()
            optionAbtn.backgroundColor = color

        case optionBbtn:
            resetButtonOption()
            optionBbtn.backgroundColor = color
        case optionCbtn:
            resetButtonOption()
            optionCbtn.backgroundColor = color
        default:
            resetButtonOption()
            optionDbtn.backgroundColor = color
        }
        
        switch sender.titleLabel?.text {
        case questions?.correctAnswer:
            
            handleShowPopUp(popUpview: popUpWindow)
            popUpWindow.initFrame(image: questions!.factImage, fact: questions!.questionFact)
            self.state = true
            self.pointsGained += questions!.reward
            stopMusic()

        default:
            handleShowPopUp(popUpview: popUpWindowForWrong)
            self.state = false

        }
    }
    
    @IBAction func btnHintPressed(_ sender: UIButton) {
        hintLeft! -= 1
        kuranginHint()
    }
    
    
    @IBAction func playBtnPressed(_ sender: Any) {
        playSound(title: questions!.questionSong)
    }
    
    @objc func handleShowPopUp(popUpview: UIView) {
        
        view.addSubview(popUpview)
        popUpview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        popUpview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpview.widthAnchor.constraint(equalToConstant: 282).isActive = true
        
        popUpview.backgroundColor = UIColor(displayP3Red: 186/255, green: 215/255, blue: 232/255, alpha: 1)
        popUpview.layer.borderWidth = 1
        popUpview.layer.borderColor = UIColor.white.cgColor
        popUpview.layer.cornerRadius = 7
        popUpview.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 0.8
            popUpview.alpha = 1
            popUpview.transform = CGAffineTransform.identity
            popUpview.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EndGameVC{
            destination.points = "\(self.pointsGained)"
        }
    }
    
    func resetButtonOption(){
        optionAbtn.backgroundColor = .white
        optionBbtn.backgroundColor = .white
        optionCbtn.backgroundColor = .white
        optionDbtn.backgroundColor = .white
    }
}

extension ViewController: PopUpDelegate{
    
    func handleDismissalYes() {
        let point = data.integer(forKey: "Points")
        switch self.state{
        case true:
            data.set(point + questions!.reward, forKey: "Points")
            self.index! += 1
            animateHide()
            setupPage(y: 2000)
            UIView.animate(withDuration: 0.5, animations: {
                self.visualEffectView.alpha = 0
                self.popUpWindow.alpha = 0
                self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }) { (_) in
                self.popUpWindow.removeFromSuperview()
                self.animateShow()
                self.initUI()
            }

        default:
            if point >= 100{
                self.popUpWindowForWrong.removeFromSuperview()
                data.set(point - 100, forKey: "Points")
                initUI()
            }
        }
        self.visualEffectView.alpha = 0
            
    }
    
    func handleDismissalNo() {
        
        switch self.state {
        case true:
            self.popUpWindow.removeFromSuperview()
            self.visualEffectView.alpha = 0
        default:
            self.popUpWindowForWrong.removeFromSuperview()
            self.visualEffectView.alpha = 0
        }
        performSegue(withIdentifier: "toEndGame", sender: self)
    }
    
}

