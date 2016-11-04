//
//  KeyFrameViewController.swift
//  SampleAnimation
//
//  Created by htx on 2016/11/3.
//  Copyright © 2016年 ofnice. All rights reserved.
//

import UIKit

class KeyFrameViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var smallBlockView: UIView!
    
    @IBOutlet weak var clockView: UIView!
    var clockLayer:ClockLayer!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.clockLayer = ClockLayer()
        self.clockLayer.datetime = NSDate()
        
        clockLayer.position = CGPoint(x: self.clockView.bounds.width/2, y: clockView.bounds.height/2)
        
        self.clockView.layer.addSublayer(clockLayer)
    }
    
    @IBAction func buttonClick(_ sender: UIBarButtonItem) {
//        shakeAnimation()
//        
//        orbitAnimation()
        
        
//        moveAnimation()
        
        shuffleAnimation()
        
        
    }
    
    @IBAction func pickerValueChanged(_ sender: UIDatePicker) {
        
        self.clockLayer.setValue(sender.date, forKey: "datetime")
        
        print("new date time")
    }
    
    func shuffleAnimation() -> Void {
        //z-index
        let zPosition = CABasicAnimation(keyPath: "zPosition")
        zPosition.fromValue = -1
        zPosition.toValue = 1
        zPosition.duration = 1.2
        
        zPosition.fillMode = kCAFillModeForwards
        zPosition.isRemovedOnCompletion = false
        
        //rotation
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotation.values = [0, 0.14, 0]
        rotation.duration = 1.2
        rotation.beginTime = 0.3
        rotation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        
        //position
        let position = CAKeyframeAnimation(keyPath: "position")
        position.values = [CGPoint.zero, CGPoint(x: 110, y:-20), CGPoint.zero]
        position.isAdditive = true
        position.duration = 1.2
        position.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        
        let group: CAAnimationGroup = CAAnimationGroup()
        group.animations = [position, rotation, zPosition ]
        group.duration = 1.2
        group.beginTime = CACurrentMediaTime() + 0.5
        
        targetLabel.layer.add(group, forKey: "group animation")
        
        targetLabel.layer.zPosition = -1
        
        
        print(targetLabel.layer.zPosition)
        
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
