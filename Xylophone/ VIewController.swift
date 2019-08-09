//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayers : [AVAudioPlayer]! = []
    

    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var lastActiveKey = "0"
    var keyIndex: Int = 0
    
    
    @IBOutlet var xilophoneKeys: [UIButton]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSounds()
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panOverKey))
        self.view.addGestureRecognizer(pan)
        
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(noteToPlay: sender.tag - 1)
        
    }
    
    func prepareSounds(){
        for sound in soundArray {
            let soundURL = Bundle.main.url(forResource: sound, withExtension: "wav")
            audioPlayers.append(AVAudioPlayer.init())

            print("KeyIndex: \(keyIndex)")
            do {
                try

                    audioPlayers[keyIndex] = AVAudioPlayer(contentsOf: soundURL!)
                    audioPlayers[keyIndex].prepareToPlay()
            }catch let error as NSError {
                print("\(error)")
            }
          keyIndex = keyIndex + 1
        }
        
    }
    
    
    func playSound(noteToPlay: Int) {
        

            
        if audioPlayers[noteToPlay].isPlaying {
                    audioPlayers[noteToPlay].currentTime = 0
                    audioPlayers[noteToPlay].play()
                    print("im playing")
                } else {
                    
                    audioPlayers[noteToPlay].play()
                    print("im playing")

                }
                
    }
    
    

    
  

}

