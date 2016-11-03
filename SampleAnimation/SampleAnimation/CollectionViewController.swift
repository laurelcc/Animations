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

        path.addCurve(to: CGPoint(x: 7.50878897,y: 25.2871097),control1: CGPoint(x: 21.7333976, y: 26.7812495), control2: CGPoint(x: 29.6894527, y: 20.225586));

        
        return path
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
