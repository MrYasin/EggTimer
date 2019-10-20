//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 420,
        "Hard": 720
    ]
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() // stop the timer if button is pressed
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"

        let hardness = sender.currentTitle! // Soft-Medium-Hard
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    
    //MARK: Update Timer Function
    
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed <= totalTime {
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
    }

    /*______________________________________________________*/
    
    
    
}
