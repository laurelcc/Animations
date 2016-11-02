//
//  CollectionViewController.swift
//  SampleAnimation
//
//  Created by htx on 2016/11/2.
//  Copyright © 2016年 ofnice. All rights reserved.
//

import UIKit
import QuartzCore

class CollectionViewController: UICollectionViewController {

    private let reuseIdentifier:String = "Cell"
    
    var pullToRefreshShape:CAShapeLayer!
    var loadingShape:CAShapeLayer!
    var loadingIndicator:UIView!
    
    var isLoading:Bool = false
    
    var primes:[String] = []
    
    lazy var pullDownAnimation:CAAnimationGroup = {
        let writeText:CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        writeText.fromValue = 0
        writeText.toValue = 1
        
        let move:CABasicAnimation = CABasicAnimation(keyPath: "position.y")
        move.fromValue = 0
        move.toValue = 1
        
        let group:CAAnimationGroup = CAAnimationGroup()
        group.duration = 1
        group.animations = [writeText, group]
        
        return group
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initParameters()
    }
    
    func initParameters() {
        self.isLoading = false
        self.primes = []
        self.setupLoadingIndicator()
        
        self.pullToRefreshShape.add(self.pullDownAnimation, forKey: "Write 'Load' as you drag down")
        
        self.fetchMoreDataWithCompletion {
            self.isLoading = false
        }
    }
    
    func setupLoadingIndicator() -> Void {
        let loadShape:CAShapeLayer = CAShapeLayer()
        loadShape.path = self.loadPath()
        
        
        
    }
    
    func loadPath()-> CGPath{
        var path = CGMutablePath()
        path.move(to: CGPoint(x: 7.50878897, y: 25.2871097))
        path.addCurve(to: CGPoint(x: 7.50878897, y: 25.2871097), control1: CGPoint(x: 26.7812495,y: 29.6894527), control2: <#T##CGPoint#>)
        
        
        path.addCurve(to: CGPoint(x: 7.50878897,y: 25.2871097),control1: CGPoint(x: 21.7333976, y: 26.7812495), control2: CGPoint(x: 29.6894527, y: 20.225586));
        
        
        
        
        
        path.addCurve(to: CGPoint(x: 37.6455074,y:  13.6699219,  39.367189,  3.85742195, 31.9697262, 1.25976564);
        path.addCurve(to: CGPoint(x: 24.5722639,y:  -1.33789083, 21.99707,   10.9072268, 21.99707,   22.2255862);
        path.addCurve(to: CGPoint(x: 21.9970685,y:  33.5439456,  15.9355469, 45.8212894, 8.99707031, 47.7294922);
        CGPathAddCurveToPoint(path, NULL,x: 2.05859375, y: 49.637695,   3.67187498, 44.0332034, 7.50878897, 44.0332034);
        CGPathAddCurveToPoint(path, NULL,x: 11.3457029,y:  44.0332034,  16.9277345, 44.234375,  25.5234372, 47.7294925);
        CGPathAddCurveToPoint(path, NULL,x: 30.55635,  y:  49.7759358,  37.9023439, 49.5410159, 44.1259762, 35.9140628);
        CGPathAddCurveToPoint(path, NULL,x: 50.349609, y:  22.2871097,  55.3105465, 25.2871099, 60.7128903, 25.2871097);
        CGPathAddCurveToPoint(path, NULL,x: 66.481445,  y: 25.2871097,  56.192383,  22.6435549, 50.8017578, 26.6455078);
        CGPathAddCurveToPoint(path, NULL,x: 45.4111325, y: 30.6474606,  43.4619148, 37.8193362, 46.0097656, 43.7333984);
        CGPathAddCurveToPoint(path, NULL,x: 48.5576169, y: 49.6474606,  57.0488304, 50.0810555, 61.8876968, 43.0097659);
        CGPathAddCurveToPoint(path, NULL,x: 66.7265637,y:  35.9384765,  65.6816424, 31.5634772, 64.4834,    27.8232425);
        CGPathAddCurveToPoint(path, NULL,x: 63.2851574,y:  24.0830078,  59.8876972, 27.8076178, 59.8876968, 31.4882815);
        CGPathAddCurveToPoint(path, NULL,x: 59.8876965,y:  35.1689453,  69.1025406, 37.2509768, 74.9531265, 32.7333987);
        CGPathAddCurveToPoint(path, NULL,x: 80.8037132,y:  28.2158207,  80.1298793, 27.0527347, 84.4970703, 25.3574219);
        CGPathAddCurveToPoint(path, NULL,x: 88.8642613,y:  23.6621091,  93.7460906, 25.37793,   96.1650391, 28.8349609);
        CGPathAddCurveToPoint(path, NULL,x: 96.1650391,y:  28.8349609,  91.6679688, 24.28711,   88.085941,  24.2871097);
        CGPathAddCurveToPoint(path, NULL,x: 84.5039132,y:  24.2871093,  74.9824181, 33.0332029, 78.5166016, 43.3417969);
        CGPathAddCurveToPoint(path, NULL,x: 82.0507847,y:  53.6503909,  92.167965,  42.5078128, 95.0117188, 38.9140625);
        CGPathAddCurveToPoint(path, NULL,x: 97.8554722,y:  35.3203122,  100.327144, 27.9042972, 100.327148, 23.3740234);
        CGPathAddCurveToPoint(path, NULL,x: 100.327152,y:  18.8437497,  96.499996,  26.5527347, 96.5,       32.7333984);
        CGPathAddCurveToPoint(path, NULL,x: 96.5000035,y:  38.9140622,  92.6337871, 53.1660163, 101.700195, 46.0400391);
        CGPathAddCurveToPoint(path, NULL,x: 110.766605,y:  38.9140622,  112.455075, 29.5751958, 118.345703, 26.9746094);
        CGPathAddCurveToPoint(path, NULL,x: 124.236332,y:  24.3740231,  129.221685, 27.5800787, 131.216798, 30.1386722);
        CGPathAddCurveToPoint(path, NULL,x: 131.216798,y:  30.1386722,  125.394529, 25.9746094, 121.82422,  25.9746097);
        CGPathAddCurveToPoint(path, NULL,x: 118.253911,y:  25.9746099,  110.588871, 32.4130862, 112.661136, 41.7500003);
        CGPathAddCurveToPoint(path, NULL,x: 114.733402,y:  51.0869143,  119.810543, 48.9121097, 125.347656, 43.0097656);
        CGPathAddCurveToPoint(path, NULL,x: 130.884769,y:  37.1074216,  137.702153, 21.0126953, 139.335938, 12.4980469);
        CGPathAddCurveToPoint(path, NULL,x: 140.969722, y: 3.98339847,  140.637699,-2.27636688, 136.845703, 7.984375);
        CGPathAddCurveToPoint(path, NULL,x: 134.586089,y:  14.0986513,  131.676762, 31.5527347, 129.884769, 38.9140628);
        CGPathAddCurveToPoint(path, NULL,x: 128.092777,y:  46.2753909,  130.551236, 50.2217745, 135.211914, 46.2753906);
        CGPathAddCurveToPoint(path, NULL,x: 146.745113,y:  36.5097659,  142.116211, 40.75,      142.116211, 40.75);
        
        
        
    }
    
    func fetchMoreDataWithCompletion(_ completion: ()->()) -> Void {
        completion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
