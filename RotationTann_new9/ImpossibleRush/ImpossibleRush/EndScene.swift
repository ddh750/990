//
//  EndScene.swift
//  ImpossibleRush
//
//  Created by Nguyen Dac Phuoc on 9/23/15.
//  Copyright (c) 2015 Game Developer. All rights reserved.
//

import SpriteKit

class EndScene: SKScene {
    var buttonMenu:SKSpriteNode?
    var buttonRestart:SKSpriteNode?
    
    override func didMove(to view: SKView) {
//        NSNotificationCenter.defaultCenter().postNotificationName("showAd", object: nil)
        
        backgroundColor = SKColor.white
        
        let userDefaults = UserDefaults.standard
        let objectBest: AnyObject? = userDefaults.value(forKey: "currentScore") as AnyObject?
        let objectScore: AnyObject? = userDefaults.value(forKey: "highscore") as AnyObject?
        if(objectBest != nil) {
            let myScore = objectBest as! Int
            let highScore = objectScore as! Int
            
            let labelCurrentScore:SKLabelNode = SKLabelNode(fontNamed:"Chalkduster")
            labelCurrentScore.text = "Score: "+String(myScore)
            labelCurrentScore.fontSize = 32
            labelCurrentScore.fontColor = SKColor.black
            labelCurrentScore.position = CGPoint(x: self.size.width/2, y: self.size.height/2 + 32)
            self.addChild(labelCurrentScore)
            
            let labelScore:SKLabelNode = SKLabelNode(fontNamed:"Chalkduster")
            labelScore.text = "Best: "+String(highScore)
            labelScore.fontSize = 32
            labelScore.fontColor = SKColor.black
            labelScore.position = CGPoint(x: self.size.width/2, y: self.size.height/2 - 16)
            self.addChild(labelScore)
        }
        
        buttonMenu = SKSpriteNode(imageNamed: "buttonMenu.png")
        buttonMenu?.position = CGPoint(x: self.size.width/2, y: self.size.height/2 - 32 - buttonMenu!.size.height/2)
        buttonMenu?.name = "buttonMenu"
        self.addChild(buttonMenu!)
        
        buttonRestart = SKSpriteNode(imageNamed: "buttonRestart.png")
        buttonRestart?.position = CGPoint(x: self.size.width/2, y: buttonMenu!.position.y - buttonMenu!.size.height - 10)
        buttonRestart?.name = "buttonRestart"
        self.addChild(buttonRestart!)
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: self)
            let node:SKNode = self.atPoint(location)
            
            if(node.name == "buttonMenu") {
                let actionButton:SKAction = SKAction.scale(to: 0.9, duration: 0.1)
                buttonMenu?.run(actionButton, completion: {
                    let menuScene = MenuScene(size: self.size)
                    self.view?.presentScene(menuScene)
                })
            }
            else if(node.name == "buttonRestart") {
                let actionButton:SKAction = SKAction.scale(to: 0.9, duration: 0.1)
                buttonRestart?.run(actionButton, completion: {
                    let gameScene = GameScene(size: self.size)
                    self.view?.presentScene(gameScene)
                })
            }
        }
    }
}
