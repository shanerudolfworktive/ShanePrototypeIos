//
//  BlinkingFaceViewController.swift
//  ShanePrototypeIos
//
//  Created by Shane on 11/14/16.
//  Copyright © 2016 Shane. All rights reserved.
//

import UIKit

class BlinkingFaceViewController : FaceViewController{
    var blinking : Bool = false{
        didSet{
            startBlink()
        }
    }
    
    private struct BlinkRate{
        static let CloseDuration = 0.4
        static let OpenDuration = 2.5
    }
    
    func startBlink(){
        if blinking {
            faceView.eyesOpen = false
            NSTimer.scheduledTimerWithTimeInterval(BlinkRate.CloseDuration, target: self, selector: #selector(BlinkingFaceViewController.endBlink), userInfo: nil, repeats: false)
        }
    }
    
    func endBlink(){
        faceView.eyesOpen = true
        NSTimer.scheduledTimerWithTimeInterval(
            BlinkRate.OpenDuration,
            target: self, selector: #selector(BlinkingFaceViewController.startBlink),
            userInfo: nil,
            repeats: false
        )
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        blinking = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        blinking = false
    }
}