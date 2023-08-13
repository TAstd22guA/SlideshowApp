//
//  ViewController.swift
//  SlideshowApp
//
//  Created by mawincommon on 2023/08/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // タイマー
    var timer: Timer!
    
    // 表示する画像の変数（番号）
    var displayNo: Int  = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //関数displayImagをオーバーライド
        displayImage()
    }

    //表示画像を１ずつカウント
    @objc func updateTimer(_ timer: Timer) {
        displayNo += 1
        displayImage()
    }

    
    //各ボタンの表示非常の設定用
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var moveOnButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    //戻るボタンの設定
    @IBAction func back(_ sender: Any) {
        displayNo -= 1
        displayImage()
    }
    
    //進むボタンの設定
    @IBAction func moveOn(_ sender: Any) {
        displayNo += 1
        displayImage()
    }
    
    //再生ボタンの設定
    //ifを使用してスライドの開始・終了、ボタン操作の可否を判断する
    @IBAction func play(_ sender: Any) {
        if self.timer == nil {
            //画像スライド開始
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self,selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            //戻る・進むボタンの操作を不可にする
            moveOnButton.isEnabled = false
            backButton.isEnabled = false
            
            //再生ボタンを「停止」にする
            playButton.setTitle("停止", for: .normal)
        }
        else{
            //スライドを停止する
            timer.invalidate()
            timer = nil
            
            //戻る・進むボタンの操作を可能にする
            moveOnButton.isEnabled = true
            backButton.isEnabled = true

            //再生ボタンを「再生」にする
            playButton.setTitle("再生", for: .normal)
        }
    }
    
    //画像を表示する関数の設定
    func displayImage() {
        let images: [String] = ["img_1.jpg","img_2.jpg","img_3.jpg","img_4.jpg","img_5.jpg","img_6.jpg"]
        
        // 範囲より下の場合、最後の画像を表示
        if displayNo < 0 {
            displayNo = 5
        }
        
        // 範囲より上の場合、最初の画像を表示
        if displayNo > 5 {
            displayNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = images[displayNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView?.image = image
        
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if timer != nil {
            play(sender as Any)
        }
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.image = self.imageView?.image
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

  
    
}

