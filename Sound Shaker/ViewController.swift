//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Hugo Morelli on 10/12/16.
//  Copyright © 2016 Hugo Morelli. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype ==  UIEventSubtype.motionShake{
            let soundArray  = [ "boing", "explosion", "hit","knife", "shoot", "swish", "wah", "warble" ]

            let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            
            let fileLocation = Bundle.main.path(forResource:soundArray[randomNumber], ofType: "mp3", inDirectory: "sounds")
            
            
            do{
                print(fileLocation)
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                player.play()
            }
            catch{
                print(error)
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

