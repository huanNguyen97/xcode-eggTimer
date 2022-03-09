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

    // Initialize data
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    // End
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        playSound()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Count down function
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
        }
    }
    // End func
    
    // Play sound func
    func playSound() {
        var player: AVAudioPlayer
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    // End func
}
