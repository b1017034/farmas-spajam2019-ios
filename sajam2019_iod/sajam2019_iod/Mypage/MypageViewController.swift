//
//  MypageViewController.swift
//  sajam2019_iod
//
//  Created by 中村　朝陽 on 2019/05/11.
//  Copyright © 2019年 asahi. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {

        @IBOutlet weak var imageBag: UIImageView!
    // 画像インスタンス
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Screen Size の取得
            let screenWidth:CGFloat = view.frame.size.width
            let screenHeight:CGFloat = view.frame.size.height
            
            // ハンドバッグの画像を設定
            imageBag.image = UIImage(named: "demomaruta.png")
            // 画像のフレームを設定
            imageBag.frame = CGRect(x:0, y:0, width:300, height:350)
            
            // 画像をスクリーン中央に設定
            imageBag.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
            
            // タッチ操作を enable
            imageBag.isUserInteractionEnabled = true
            
            self.view.addSubview(imageBag)
            
        }
        
        // 画面にタッチで呼ばれる
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            print("touchesBegan")
            
        }
        
        //　ドラッグ時に呼ばれる
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            // タッチイベントを取得
            let touchEvent = touches.first!
            
            // ドラッグ前の座標, Swift 1.2 から
            let preDx = touchEvent.previousLocation(in: self.view).x
            let preDy = touchEvent.previousLocation(in: self.view).y
            
            // ドラッグ後の座標
            let newDx = touchEvent.location(in: self.view).x
            let newDy = touchEvent.location(in: self.view).y
            
            // ドラッグしたx座標の移動距離
            let dx = newDx - preDx
            print("x:\(dx)")
            
            // ドラッグしたy座標の移動距離
            let dy = newDy - preDy
            print("y:\(dy)")
            
            // 画像のフレーム
            var viewFrame: CGRect = imageBag.frame
            
            // 移動分を反映させる
            viewFrame.origin.x += dx
            viewFrame.origin.y += dy
            
            imageBag.frame = viewFrame
            
            self.view.addSubview(imageBag)
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    @IBAction func label1drag(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        //これでドラッグしている間は指に付いてくる
        case .changed:
            imageBag.center = sender.location(in: self.view)
        //これで離した瞬間x:200, y:462に戻ってくる
        case .ended:
            //imageBag.center = CGPoint(x:200, y:462)
            UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
                self.imageBag.center.y -= 600.0
            }, completion: nil)
        default:
            break
        }
        
    }
    @IBAction func tap(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Timeline", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
    
}
