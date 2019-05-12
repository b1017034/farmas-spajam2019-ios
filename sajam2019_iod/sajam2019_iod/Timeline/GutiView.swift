//
//  GutiView.swift
//  sajam2019_iod
//
//  Created by 中村　朝陽 on 2019/05/11.
//  Copyright © 2019年 asahi. All rights reserved.
//

import UIKit

class GutiView: UIView {

    @IBOutlet var woodImageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    var count = 0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        woodImageView.sendSubviewToBack(superview!)
        
        self.backgroundColor = UIColor.init(hex: "4ACFAC")
        textLabel.numberOfLines=0
    }
}
