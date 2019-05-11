//
//  OnsenViewController.swift
//  
//
//  Created by 中村　朝陽 on 2019/05/11.
//

import UIKit

class OnsenViewController: UIViewController {
    
    var fire: Int = 2
    
    @IBOutlet weak var smokeImage: UIImageView!
    
    var img1 = UIImage(named:"IMG_2614.PNG")!
    var img2 = UIImage(named:"IMG_2615.PNG")!
    var img3 = UIImage(named:"IMG_2616.PNG")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       if fire < 1 {
            smokeImage.image = img1
        } else if fire < 2 {
            smokeImage.image = img2
        } else {
            smokeImage.image = img3
        }
    }
    
    @IBAction func postButton(_ sender: Any) {
        /*let storyboard: UIStoryboard = UIStoryboard(name: "Post", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "postViewController") as! PostViewController
        //self.show(vc, sender: self)
        self.present(vc, animated: true, completion: nil)*/
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
