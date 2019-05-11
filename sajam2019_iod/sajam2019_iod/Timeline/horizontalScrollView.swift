//
//  horizontalScrollView.swift
//  sajam2019_iod
//
//  Created by 中村　朝陽 on 2019/05/12.
//  Copyright © 2019年 asahi. All rights reserved.
//

import UIKit

protocol horizontalScrollViewDelegate: NSObjectProtocol{
    func numberOfSection() -> Int
    func Color() -> String
    func horizontalScrollViewDidScroll(_ horizantalScrollView: horizontalScrollView)
    func horizontalScrollView(_ horizantalScrollView: horizontalScrollView, _ scrollBackView: UIView, _ count: Int)
}

class horizontalScrollView: UIScrollView {
    
    weak open var horizaontalDelegate: horizontalScrollViewDelegate?
    private var count = 0
    private let scrollBackView = UIView()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.count = (self.horizaontalDelegate?.numberOfSection())!
        self.delegate = self
        
        scrollBackView.frame.origin.x = self.frame.origin.x
        scrollBackView.frame.origin.y = self.frame.origin.y
        scrollBackView.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.maxX * CGFloat(self.count), height: self.frame.maxY)
        scrollBackView.backgroundColor = UIColor.init(hex: (self.horizaontalDelegate?.Color())!)
        
        self.backgroundColor = UIColor.init(hex: (self.horizaontalDelegate?.Color())!)
        
        for i in 0...self.count - 1{
            self.horizaontalDelegate?.horizontalScrollView(self, self.scrollBackView, i)
        }
        self.addSubview(scrollBackView)
        self.contentSize = CGSize(width: self.frame.size.width * CGFloat(self.count), height: self.frame.size.height)
    }
    
}

extension horizontalScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.horizaontalDelegate?.horizontalScrollViewDidScroll(self)
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}

