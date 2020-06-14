//
//  PlaySound.swift
//  NC3-QuizApp
//
//  Created by Reyhan Rifqi on 14/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import AVFoundation

var player: AVAudioPlayer?

    func playSound(title: String){
        if let soundURL = Bundle.main.url(forResource: title, withExtension: "mp3"){
            do{
                try player = AVAudioPlayer(contentsOf: soundURL)
                player?.play()

            }catch{
                print(error)
            }
        }
    }

    func stopMusic(){
        player?.stop()
    }
