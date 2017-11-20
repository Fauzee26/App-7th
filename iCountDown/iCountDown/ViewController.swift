//
//  ViewController.swift
//  iCountDown
//
//  Created by Muhammad Hilmy Fauzi on 20/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var seconds = 30
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider)
    {
        seconds = Int(sender.value)
        label.text = String(seconds) + " Seconds"
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: AnyObject)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    @objc func counter()
    {
        seconds -= 1
        label.text = String(seconds) + " Seconds"
        
        if (seconds == 0)
        {
            timer.invalidate()
            
      //      audioPlayer.play()
        }
    }
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stop(_ sender: AnyObject)
    {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30 Seconds"
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let pathAudio = NSURL.fileURL(withPath: Bundle.main.path(forResource: "123", ofType: ".mp3")!)

            do
            {
                let audioSound = try
                    AVAudioPlayer(contentsOf: pathAudio)
                audioPlayer = audioSound
            }catch let error as Error {
                print(error.localizedDescription)
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



