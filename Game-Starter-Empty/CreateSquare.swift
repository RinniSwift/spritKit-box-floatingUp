//
//  CreateSquare.swift
//  Game-Starter-Empty
//
//  Created by Rinni Swift on 10/2/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class CreateSquare: SKSpriteNode {
    init(name: String, size: CGSize, color: UIColor) {
        super.init(texture: nil, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
