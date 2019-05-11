//
//  treeView.swift
//  sajam2019_iod
//
//  Created by 山田楓也 on 2019/05/12.
//  Copyright © 2019 asahi. All rights reserved.
//

import UIKit

class treeView: UIView {

    @IBOutlet weak var tree: UIImageView!
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        tree.sendSubviewToBack(superview!)
        
       // self.backgroundColor = UIColor.init(hex: "4ACFAC")
    }

}
