//
//  TimelineViewController.swift
//  sajam2019_iod
//
//  Created by 中村　朝陽 on 2019/05/11.
//  Copyright © 2019年 asahi. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var ScrollBackView = UIView()
    
    var gutiViews: [GutiView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        
        ScrollBackView.frame.origin.x = scrollView.frame.origin.x
        ScrollBackView.frame.origin.y = scrollView.frame.origin.y
        ScrollBackView.frame = CGRect(x: scrollView.frame.minX, y: scrollView.frame.minY, width: scrollView.frame.maxX * 3, height: scrollView.frame.maxY)
        ScrollBackView.backgroundColor = UIColor.init(hex: "4ACFAC")
        scrollView.addSubview(ScrollBackView)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * 3,
                                        height: scrollView.frame.size.height)
        
        initializeGuiView(count: 2)
        // Do any additional setup after loading the view.
    }
    
    func initializeGuiView(count: Int){
        for i in 0...count {
            gutiViews.append(Bundle.main.loadNibNamed("GutiView", owner: self, options: nil)!.first! as! GutiView)
            gutiViews[i].frame = scrollView.frame
            gutiViews[i].frame.origin.y = scrollView.frame.origin.y
            let cgx: CGFloat = scrollView.frame.origin.x
            gutiViews[i].frame.origin.x = cgx + CGFloat(i) * scrollView.frame.width
            gutiViews[i].textLabel.text = "殺すぞ"
            ScrollBackView.addSubview(gutiViews[i])
            print("gutiViews[" + "\(i)" + "]: " + "\(gutiViews[i].frame)")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension TimelineViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
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
