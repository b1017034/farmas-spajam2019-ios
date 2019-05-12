//
//  TimelineViewController.swift
//  sajam2019_iod
//
//  Created by 中村　朝陽 on 2019/05/11.
//  Copyright © 2019年 asahi. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TimelineViewController: UIViewController {

    @IBOutlet var scrollView: horizontalScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    @IBAction func toMypageButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Mypage", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
    @IBAction func toPostButton(_ sender: Any) {
        let sb = UIStoryboard(name: "post", bundle: nil)
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
        gutiViews[currentPage].setImage()
    }
    
    @IBAction func touchUpInsideLiter(_ sender: Any) {
        honouImage.isHidden = true
    }
    
    @IBAction func touchUpOutsideLighter(_ sender: Any) {
        honouImage.isHidden = true
        
    }
    
    @IBOutlet var honouImage: UIButton!
    var gutiViews: [GutiView] = []
    var items: [String] = []
    var keepAlive = true
    var currentPage = 0
    let runLoop = RunLoop.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.horizaontalDelegate = self
        honouImage.isHidden = true
        // Do any additional setup after loading the view.
        getData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func getData(){
        let ref = Database.database().reference()
        //observeイベント
        ref.observe(.value, with: {(snapShots) in
            for snapShot in snapShots.children {
                let child = snapShot as! DataSnapshot
                for value in child.children{
                    let item = value as! DataSnapshot
                    let dict = item.value as! NSDictionary
                    self.items.append(dict["text"] as! String)
                }
            }
            self.keepAlive = false
        })
        while self.keepAlive && self.runLoop.run(mode: RunLoop.Mode.default, before:NSDate(timeIntervalSinceNow: 0.1) as Date) {
        }
        print(self.items.count)
    }
}

extension TimelineViewController: horizontalScrollViewDelegate{
    func horizontalScrollView(_ horizantalScrollView: horizontalScrollView, _ scrollBackView: UIView, _ count: Int) {
        gutiViews.append(Bundle.main.loadNibNamed("GutiView", owner: self, options: nil)!.first! as! GutiView)
        gutiViews[count].frame = scrollView.frame
        gutiViews[count].frame.origin.y = scrollView.frame.origin.y
        let cgx: CGFloat = scrollView.frame.origin.x
        gutiViews[count].frame.origin.x = cgx + CGFloat(count) * scrollView.frame.width
        gutiViews[count].textLabel.text = self.items[count]
        scrollBackView.addSubview(gutiViews[count])
        print("gutiview: \(gutiViews[count].frame) \(count)")
    }
    
    func numberOfSection() -> Int {
        pageControl.numberOfPages = items.count
        return self.items.count
    }
    
    func Color() -> String {
        return "4ACFAC"
    }
    
    func horizontalScrollViewDidScroll(_ horizantalScrollView: horizontalScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.currentPage = pageControl.currentPage
    }

}

