//
//  panView.swift
//  Xylophone
//
//  Created by Antonio Orozco on 8/9/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

extension ViewController {
    
    @objc func panOverKey(sender : UIPanGestureRecognizer) {
        
        let touchPoint = sender.location(in: self.view)
        
        for key in xilophoneKeys {
            
            if key.frame.contains(touchPoint) {
                
                if key.tag != Int(lastActiveKey)
                {
                    print("panPlayer sound for \(key.tag)")
                    
                    //selectedSoundFileName = soundArray[key.tag - 1]
                    
                    //print(selectedSoundFileName)
                    
                    playSound(noteToPlay: key.tag - 1)
                    
                }
                
            }
            
        }
        
    }
    
    
    
}
