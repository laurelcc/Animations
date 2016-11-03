//
//  KeyFrameViewController.swift
//  SampleAnimation
//
//  Created by htx on 2016/11/3.
//  Copyright © 2016年 ofnice. All rights reserved.
//

import UIKit

class KeyFrameViewController: UIViewController {
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var smallBlockView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClick(_ sender: UIBarButtonItem) {
//        shakeAnimation()
//        
//        orbitAnimation()
        
        
        moveAnimation()
    }
    
    func moveAnimation() {
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "position.y")
        animation.fromValue = targetLabel.center.y
        animation.toValue = targetLabel.center.y + 300
        animation.duration = 1
        
//        animation.fillMode = kCAFillModeForwards
//        animation.isRemovedOnCompletion = false
        
        animation.autoreverses = true
        animation.repeatCount = HUGE
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        targetLabel.layer.add(animation, forKey: "move animation")
        
        
        
    }
    
    func orbitAnimation() -> Void {
        let sqrtX = pow(Double(targetLabel.center.x - smallBlockView.center.x), 2)
        let sqrtY = pow(Double(targetLabel.center.y - smallBlockView.center.y), 2)
        let centerLength = sqrt(sqrtX + sqrtY)
        
        let boundingRect = CGRect(x: -CGFloat(centerLength), y: 0, width: CGFloat(centerLength * 2), height: CGFloat(centerLength * 2))
        
        let orbitAnimation = CAKeyframeAnimation(keyPath: "position")
        orbitAnimation.path = CGPath(rect: boundingRect, transform: nil)
        orbitAnimation.duration = 4
        orbitAnimation.isAdditive = true
        orbitAnimation.repeatCount = HUGE
        orbitAnimation.calculationMode = kCAAnimationPaced
        orbitAnimation.rotationMode = kCAAnimationRotateAuto
        
        smallBlockView.layer.add(orbitAnimation, forKey: "orbit")
    }
    
    func shakeAnimation() -> Void {
        let animation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position.x")
        
        animation.values = [0, 30, -30, 0]
        animation.keyTimes = [0, NSNumber(value: 1.0/6), NSNumber(value:3.0/6), NSNumber(value: 5.0/6), 1]
        animation.duration = 0.4
        animation.isAdditive = true
        
        targetLabel.layer.add(animation, forKey: "shake")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
