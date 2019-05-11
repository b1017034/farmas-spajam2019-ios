//
//  TimelineViewController.swift
//  sajam2019_iod
//
//  Created by 中村　朝陽 on 2019/05/11.
//  Copyright © 2019年 asahi. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet var scrollView: horizontalScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    @IBAction func toMypageButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Mypage", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func toOnsenButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Onsen", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
    @IBAction func touchDownLighter(_ sender: Any) {
        honouImage.isHidden = false
    }
    
    @IBAction func touchUpInsideLiter(_ sender: Any) {
        honouImage.isHidden = true
    }
    
    @IBAction func touchUpOutsideLighter(_ sender: Any) {
        honouImage.isHidden = true
    }
    
    @IBOutlet var honouImage: UIButton!
    var gutiViews: [GutiView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.horizaontalDelegate = self
        honouImage.isHidden = true
        // Do any additional setup after loading the view.
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

extension TimelineViewController: horizontalScrollViewDelegate{
    func horizontalScrollView(_ horizantalScrollView: horizontalScrollView, _ scrollBackView: UIView, _ count: Int) {
        gutiViews.append(Bundle.main.loadNibNamed("GutiView", owner: self, options: nil)!.first! as! GutiView)
        gutiViews[count].frame = scrollView.frame
        gutiViews[count].frame.origin.y = scrollView.frame.origin.y
        let cgx: CGFloat = scrollView.frame.origin.x
        gutiViews[count].frame.origin.x = cgx + CGFloat(count) * scrollView.frame.width
        gutiViews[count].textLabel.text = "殺すぞ"
        scrollBackView.addSubview(gutiViews[count])
        print("gutiview: \(gutiViews[count].frame) \(count)")
    }
    
    func numberOfSection() -> Int {
        return 3
    }
    
    func Color() -> String {
        return "4ACFAC"
    }
    
    func horizontalScrollViewDidScroll(_ horizantalScrollView: horizontalScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }

}

