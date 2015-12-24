//
//  ViewController.swift
//  Swift-Rotate-Vader
//
//  Created by Francisco José A. C. Souza on 24/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let deviceManager = CMMotionManager()

    @IBOutlet weak var darthVaderImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.rotateDarthVader()
    }

    func rotateDarthVader(){
        if self.deviceManager.accelerometerAvailable {
            self.deviceManager.accelerometerUpdateInterval = 1.0
            
            self.deviceManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data, error) -> Void in
                
                let xAcceleration = data!.acceleration.x
                let yAcceleration = data!.acceleration.y
                let angle = CGFloat( atan2(xAcceleration, yAcceleration) - M_PI )
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.darthVaderImageView.transform = CGAffineTransformMakeRotation(angle)
                })
                
            })
        }
    }


}

