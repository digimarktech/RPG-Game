//
//  DevilWizard.swift
//  RPGOOP
//
//  Created by Marc Aupont on 1/21/16.
//  Copyright © 2016 Digimark Technical Solutions. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        
        return "Devil Wizard"
    }
}