//
//  ClockLayer.swift
//  SampleAnimation
//
//  Created by htx on 2016/11/4.
//  Copyright © 2016年 ofnice. All rights reserved.
//

import UIKit
import AVFoundation

class ClockLayer: CAShapeLayer {
    dynamic var datetime:NSDate?
    
    var hourHand:CAShapeLayer!
    var minuteHand:CAShapeLayer!
    
    override func display() {
        print("Hello display again.\(self.datetime)")
        
        let player: AVAudioPlayer?
    }
    
    override static func needsDisplay(forKey:String) -> Bool {
        if forKey == "datetime" {
            return true
        }
        
        return super.needsDisplay(forKey: forKey)
    }
    
    override func action(forKey event: String) -> CAAction? {
        if event == "datetime" {
            print("date time key secton")
        }
        
        return super.action(forKey: event)
    }
    
    override init(){
        super.init()
        
        self.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 200))
        self.path = UIBezierPath(ovalIn: self.bounds).cgPath
        self.fillColor = UIColor.white.cgColor
        self.strokeColor = UIColor.black.cgColor
        self.lineWidth = 4
        
        //hour hand
        self.hourHand = CAShapeLayer()
        self.hourHand.path = UIBezierPath(rect: CGRect(x: -2, y: -70, width: 4, height: 70)).cgPath
        self.hourHand.fillColor = UIColor.black.cgColor
        self.hourHand.position = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        self.addSublayer(self.hourHand)
        
        //minute hand
        self.minuteHand = CAShapeLayer()
        self.minuteHand.path = UIBezierPath(rect: CGRect(x: -1, y: -90, width: 2, height: 90)).cgPath
        self.minuteHand.fillColor = UIColor.black.cgColor
        self.minuteHand.position = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        
        self.addSublayer(self.minuteHand)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
