//
//  ViewController.swift
//  RPGOOP
//
//  Created by Marc Aupont on 1/21/16.
//  Copyright © 2016 Digimark Technical Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    @IBOutlet var printLabel: UILabel!
    
    @IBOutlet var playerHpLabel: UILabel!
    
    @IBOutlet var enemyHpLabel: UILabel!
    
    @IBOutlet var enemyImage: UIImageView!
    
    @IBOutlet var chestButton: UIButton!
    
    @IBAction func onChestTapped(sender: AnyObject) {
        
        chestButton.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            
            enemyHpLabel.text = "\(enemy.hp) HP"
            
        } else {
            
            printLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLabel.text = "\(player.hp)"
        
    }
    
    func generateRandomEnemy() {
        
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            
            enemy = Kimara(startingHp: 50, attackPwr: 12)
            
        } else {
            
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        
        enemyImage.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

