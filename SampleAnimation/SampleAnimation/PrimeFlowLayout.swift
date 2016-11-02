//
//  PrimeFlowLayout.swift
//  SampleAnimation
//
//  Created by htx on 2016/11/2.
//  Copyright © 2016年 ofnice. All rights reserved.
//

import UIKit

class PrimeFlowLayout: UICollectionViewFlowLayout {
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        
        var transform:CATransform3D = CATransform3DIdentity
        transform.m34 = -1/800
        transform = CATransform3DRotate(transform, CGFloat(M_PI_2) , -1, 0, 0)
        transform = CATransform3DScale(transform, 0.8, 0.8, 0.8)
        attributes?.transform3D = transform
        
        return attributes
    }
    
}
