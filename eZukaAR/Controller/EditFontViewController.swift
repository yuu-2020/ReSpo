//
//  EditFontViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/10.
//

import UIKit

class EditFontViewController: UIViewController {
    
    var playerImage: UIImage?
    var effectedImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var effectImageView: UIImageView!
    @IBOutlet weak var nameEffectImageView: UIImageView!
    
    @IBOutlet weak var sc: UIScrollView!
    
    var uv: UIView = UIView()
    var label: UILabel = UILabel()
    var count: Int = 0 // しゃーない
    
    var playerName: String = String()
    var font: UIFont = UIFont()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = playerImage
        effectImageView.image = effectedImage
        
        // 位置とサイズを決める
        uv.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*2, height: 70)
        
        // uiButtonを作成する
        for i in 8..<12 {
            let button: UIButton = UIButton()
            button.frame = CGRect(x: (count*80), y: 0, width: 80, height: 80)
            button.tag = i
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            let buttonImage: UIImage = UIImage(named: String(i+1))!
            button.setImage(buttonImage, for: UIControl.State.normal)
            uv.addSubview(button)
            
            // 仕方ない変数
            count = count + 1
        }
        // scにuvを貼る
        sc.addSubview(uv)
        sc.contentSize = uv.bounds.size
    }
    
    @objc func tap(sender: UIButton) {
        // tagの番号によって，imageViewのimageをフィルターをつけたい
        nameEffectImageView.image = UIImage(named: String(sender.tag))
        
//        self.view.subviews.forEach {
//            if $0.tag != tag {
//                $0.removeFromSuperview()
//            }
//        }
        label.removeFromSuperview()
        label = createLabel(tag: sender.tag, text: "aaaaaaaaaaaaa", font: UIFont.boldSystemFont(ofSize: 20))
        self.view.addSubview(label)
        
//        switch sender.tag {
//        case 8:
//            print("8")
//            nameEffectImageView.image = UIImage(named: "9")
//        case 9:
//            print("9")
//            nameEffectImageView.image = UIImage(named: "10")
//        case 10:
//            print("10")
//            nameEffectImageView.image = UIImage(named: "11")
//        case 11:
//            print("11")
//            nameEffectImageView.image = UIImage(named: "12")
//        case 12:
//            print("12")
//            nameEffectImageView.image = UIImage(named: "13")
//        default:
//            break
//        }
        
    }
    
    func createLabel(tag: Int, text: String, font: UIFont) -> UILabel{
        
        let label_line: UILabel = UILabel()
        label_line.tag = tag
        label_line.text = text
        label_line.font = font

        let label_column: UILabel = UILabel()
        label_column.tag = tag
        label_column.text = text
        label_column.font = font
        
//        label.tag = tag
//        label.text = text
//        label.font = font
        
        /// -MARK: debug
        print(tag)
        
        if tag%2 == 0 {
//            label.frame = CGRect(x: -187, y: 265, width: 480, height: 60)
//            label.transform = CGAffineTransform(rotationAngle: CGFloat(90 * CGFloat.pi / 180))
//            self.view.addSubview(label)
            label_line.removeFromSuperview()
            label_column.frame = CGRect(x: -187, y: 265, width: 480, height: 60)
            label_column.transform = CGAffineTransform(rotationAngle: CGFloat(90 * CGFloat.pi / 180))
//            self.view.addSubview(label_column)
            return label_column
        } else {
//            label.frame = CGRect(x: 22.5, y: 475, width: 330, height: 60)
//            self.view.addSubview(label)
            label_column.removeFromSuperview()
            label_line.frame = CGRect(x: 22.5, y: 475, width: 330, height: 60)
//            self.view.addSubview(label_line)
            return label_line
        }
    }
}
