//
//  GameViewController.swift
//  ImpossibleRush
//
//  Created by Nguyen Dac Phuoc on 9/15/15.
//  Copyright (c) 2015 Game Developer. All rights reserved.
//

import UIKit
import SpriteKit
// import iAd


extension SKNode {
    class func unarchiveFromFile(_ file : String) -> SKNode? {
        if let path = Bundle.main.path(forResource: file, ofType: "sks") {
            let sceneData = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWith: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController/*, ADBannerViewDelegate*/ {
    
//    var bannerView:ADBannerView?
    var isLoadedAd:Bool?
    @IBOutlet weak var _mySkView: SKView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MenuScene(size: CGSize(width: 768, height: 1024))
        
        // Configure the view.
        let skView = _mySkView as SKView;//self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
//        /* Set the scale mode to scale to fit the window */
//        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
        

    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
//    func bannerViewDidLoadAd(banner: ADBannerView!) {
//        isLoadedAd = true
//        bannerView?.hidden = false
//    }
//    
//    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
//        isLoadedAd = false
//        bannerView?.hidden = true
//    }

   
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIInterfaceOrientationMask.allButUpsideDown
        } else {
            return UIInterfaceOrientationMask.all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
