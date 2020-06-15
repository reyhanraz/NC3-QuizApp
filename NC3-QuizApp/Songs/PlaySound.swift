//
//  PlaySound.swift
//  NC3-QuizApp
//
//  Created by Reyhan Rifqi on 14/06/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import AVFoundation

var player: AVAudioPlayer?

func playSound(title: String, ext: String){
        if let soundURL = Bundle.main.url(forResource: title, withExtension: ext){
            do{
                try player = AVAudioPlayer(contentsOf: soundURL)
                player?.play()

            }catch{
                print(error)
            }
        }
    }

    func playSoundLoop(title: String){
        if let soundURL = Bundle.main.url(forResource: title, withExtension: "mp3"){
            do{
                try player = AVAudioPlayer(contentsOf: soundURL)
                player?.numberOfLoops = 1000
                player?.play()

            }catch{
                print(error)
            }
        }
    }

    func stopMusic(){
        player?.stop()
    }

func soundMute(){
    player?.setVolume(0.0, fadeDuration: 0.2)
}

func soundUnMute(){
    player?.setVolume(1.0, fadeDuration: 0.2)
}
