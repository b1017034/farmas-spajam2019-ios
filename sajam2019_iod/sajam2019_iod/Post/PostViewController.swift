//
//  PostViewController.swift
//  sajam2019_iod
//
//  Created by 中村　朝陽 on 2019/05/11.
//  Copyright © 2019年 asahi. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextFieldDelegate {
     //入力されたテキストの保存用変数
    var input_textString = ""
    
    @IBOutlet weak var input_text: UITextField!
    
    //投稿ボタン###############################################################################
    @IBAction func toPost(_ sender: Any) {
        //textViewから文字を取得
        input_textString = input_text.text!
        
        //textFieldの中身をクリア
        input_text.text = "何を愚痴る・・・？？"
        
        //部品のアラートを作る
        let alertController = UIAlertController(title: "投稿が完了しました", message: "", preferredStyle: UIAlertController.Style.alert)
        //OKボタン追加
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) in
            
            //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // 0.5秒後に実行したい処理
                    self.dismiss(animated: true, completion: nil)
            }
        }
        )
        
        alertController.addAction(okAction)
        
        //アラートを表示する
        present(alertController, animated: true, completion: nil)
        

    }
    //###############################################################################
    
    //キャンセルボタン#################################################################
    @IBAction func cancel(_ sender: Any) {
        //１つ前の画面へ
        self.dismiss(animated: true, completion: nil)
    }
    //###############################################################################
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textFieldの情報を受け取るためのdelegateを設定
        input_text.delegate = self
        view.backgroundColor = UIColor.init(red: 74/255, green: 207/255, blue: 172/255, alpha: 100/100)
    }
    
    //「改行」や「Return」などのキーを押したときに呼ばれる#################################
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    //UItextField以外の部分をタッチしたとき############################################
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.input_text.isFirstResponder {
            //キーボードを閉じる
            self.input_text.resignFirstResponder()
            
            if input_text.text == ""{
                input_text.text = "何を愚痴る・・・？？"
            }
        }
    }
    //##########################################################################
    //textfieldをクリックした時、textFieldの中身をクリア
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if input_text.text == "何を愚痴る・・・？？"{
        input_text.text = ""
    }
    }
   
   
}
