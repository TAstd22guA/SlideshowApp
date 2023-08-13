//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by mawincommon on 2023/08/13.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    //画像の表示
        imageView?.image = self.image
    }
    
}
