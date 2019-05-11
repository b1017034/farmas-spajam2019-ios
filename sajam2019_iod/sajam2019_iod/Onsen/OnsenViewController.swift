//
//  OnsenViewController.swift
//  
//
//  Created by 中村　朝陽 on 2019/05/11.
//

import UIKit

class OnsenViewController: UIViewController {
    
    var fire: Int = 2

    @IBOutlet weak var onsenImages: UIImageView!
    
    var img1 = UIImage(named:"onsenImage/IMG_2618.PNG")
    var img2 = UIImage(named:"onsenImage/IMG_2627.PNG")
    var img3 = UIImage(named:"onsenImage/IMG_2624.PNG")
    var img4 = UIImage(named:"onsenImage/IMG_2626.PNG")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if fire < 0 {
            onsenImages.image = img1
        } else if fire == 1 {
            onsenImages.image = img2
        } else if fire == 2 {
            onsenImages.image = img3
        } else {
            onsenImages.image = img4
        }
    }
    
    @IBAction func postButton(_ sender: Any) {
    }
    @IBAction func mypageButton(_ sender: Any) {
    }
    @IBAction func timelineButton(_ sender: Any) {
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
