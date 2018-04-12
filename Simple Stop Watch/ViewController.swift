//
//  ViewController.swift
//  Simple Stop Watch
//
//  Created by 김종현 on 2018. 4. 9..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var count = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    @IBAction func startButton(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
        changeButoonState(start: false, stop: true, reset: true)
    }
    
    @IBAction func stopButton(_ sender: Any) {
        myTimer.invalidate()
        changeButoonState(start: true, stop: false, reset: true)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        myTimer.invalidate()
        timeLabel.text = "00:00:00"
        count = 0
        changeButoonState(start: true, stop: true, reset: false)
    }
    
    func changeButoonState(start: Bool, stop: Bool, reset: Bool) {
        startButton.isEnabled = start
        stopButton.isEnabled = stop
        resetButton.isEnabled = reset
    }

}

