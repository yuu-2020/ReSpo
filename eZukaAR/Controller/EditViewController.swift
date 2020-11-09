//
//  EditViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/09.
//

import UIKit

class EditViewController: UIViewController {

    var editImage: UIImage?
    
    @IBOutlet weak var effectImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sc: UIScrollView!
    
    var uv: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = editImage
        
        // 位置とサイズを決める
        uv.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*2, height: 70)
        
        // uiButtonを作成する
        for i in 0..<7 {
            let button: UIButton = UIButton()
            button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
            button.tag = i
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            let buttonImage: UIImage = UIImage(named: String(i+1))!
            button.setImage(buttonImage, for: UIControl.State.normal)
            uv.addSubview(button)
        }
        // scにuvを貼る
        sc.addSubview(uv)
        sc.contentSize = uv.bounds.size
    }
    
    @objc func tap(sender: UIButton) {
        // tagの番号によって，imageViewのimageをフィルターをつけたい
        switch sender.tag {
        case 0:
            print("1")
            effectImageView.image = UIImage(named: "1")
        case 1:
            print("2")
            effectImageView.image = UIImage(named: "2")
        case 2:
            print("3")
            effectImageView.image = UIImage(named: "3")
        case 3:
            print("4")
            effectImageView.image = UIImage(named: "4")
        case 4:
            print("5")
            effectImageView.image = UIImage(named: "5")
        case 5:
            print("6")
            effectImageView.image = UIImage(named: "6")
        case 6:
            print("7")
            effectImageView.image = UIImage(named: "7")
        default:
            break
                
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
