//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        blurButton(button: sender,
                   alpha: 0.5,
                   until: .now() + 0.2 )
        playSound(soundName: sender.currentTitle!)
    }
    
    
    
    func playSound(soundName: String) {
//        DispatchQueue.main.async { [self] in
            let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
//        }
        
    }
    
    
    
    func blurButton( button: UIButton, alpha: CGFloat, until: DispatchTime){
        
        button.alpha = alpha
        
//        continue after timeout and restore the button alpha
        DispatchQueue.main.asyncAfter(deadline: until ) {
            button.alpha = 1
        }
    }
}

