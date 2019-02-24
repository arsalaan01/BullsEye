//
//  ViewController.swift
//  BullsEye
//
//  Created by Arsalaan Ali on 06/02/19.
//  Copyright © 2019 Arsalaan Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    @IBOutlet weak var targetLabel:UILabel!
    var score = 0
    @IBOutlet weak var scoreLabel:UILabel!
    var round = 0
    @IBOutlet weak var roundLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    func startNewRound() {
        round += 1
        targetValue = 1+Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of the slider is now:\(slider.value)")
        currentValue = lroundf(slider.value)
        
    }
    // start over method
    @IBAction func startNewGame(){
            score = 0
            round = 0
            startNewRound()
    }
    /*@IBAction func startOver(){
        startNewGame()
    }*/

    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            if difference == 1{
                points += 50
            }
        }else if difference < 10 {
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }
        score += points
        
        //let message = "The value of the slider is:\(currentValue)" + "\nThe target value is \(targetValue)" + "\nThe difference is:\(difference)"
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
                self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true , completion: nil)
        
    }
    
}

