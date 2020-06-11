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

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionAbtn: UIButton!
    @IBOutlet weak var optionBbtn: UIButton!
    @IBOutlet weak var optionCbtn: UIButton!
    @IBOutlet weak var optionDbtn: UIButton!
    @IBOutlet weak var pointsLbl: UILabel!
    
    @IBOutlet weak var hint1Img: UIImageView!
    @IBOutlet weak var hint2Img: UIImageView!
    @IBOutlet weak var hint3Img: UIImageView!
    
    var hintLeft: Int?

    var index: Int?
    let ListOfQuestion: [question] = [
        question(question: "Who is the singer of the song?", correctAnswer: "Jason Mraz", optionA: "Jason Momoa", optionB: "Michael Jakson", optionC: "Jason Mraz", optionD: "Justin Timberlake", reward: 5),
        question(question: "What is the title of the song?", correctAnswer: "Celine Dion", optionA: "Celine Dion", optionB: "Demi Lovato", optionC: "Jessie J", optionD: "Taylor Swift", reward: 10)]
    var questions: question?
    
    var player: AVAudioPlayer!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
        optionAbtn.layer.cornerRadius = 20
        optionBbtn.layer.cornerRadius = 20
        optionCbtn.layer.cornerRadius = 20
        optionDbtn.layer.cornerRadius = 20

        
        hintLeft = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func initUI(){
        self.questions = ListOfQuestion[index!]
        questionLabel.text = questions?.question
        optionAbtn.setTitle(questions?.optionA, for: .normal)
        optionBbtn.setTitle(questions?.optionB, for: .normal)
        optionCbtn.setTitle(questions?.optionC, for: .normal)
        optionDbtn.setTitle(questions?.optionD, for: .normal)
        pointsLbl.text = "\(data.integer(forKey: "Points"))"
    }
    
    func playMusic(){
        let soundURL = Bundle.main.url(forResource: "bensound-ukulele", withExtension: "mp3")
        do{
            try player = AVAudioPlayer(contentsOf: soundURL!)
        }catch{
            print(error)
        }
        player?.play()
        print(player?.duration)

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
    @IBAction func toStageModal(_ sender: UIButton){
        performSegue(withIdentifier: "toStageModal", sender: nil)
    }

    @IBAction func answerFunction(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case questions?.correctAnswer:
            let point = data.integer(forKey: "Points")
            data.set(point + questions!.reward, forKey: "Points")
            self.index! += 1
            initUI()
        default:
            hintLeft! -= 1
            kuranginHint()
            print("Salah")
        }
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        playMusic()
    }
}

