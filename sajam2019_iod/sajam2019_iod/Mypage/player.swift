//
//  player.swift
//  sajam2019_iod
//
//  Created by 山田楓也 on 2019/05/12.
//  Copyright © 2019 asahi. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode{
    
    func movePlayer(moveLeft: Bool){
        if moveLeft{
            print("moveLeft");
            self.position.x -= 10;
        }else{
            print("moveRight");
            self.position.x += 10;
        }
    }
    
}
