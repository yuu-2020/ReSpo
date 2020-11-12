//
//  EditFontViewController6.swift
//  eZukaAR
//
//  Created by Nanako Shimizu on 2020/11/11.
//

import UIKit

class EditFontViewController6: UIViewController {
    
    var playerImage: UIImage?
    var effectedImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var effectImageView: UIImageView!
    @IBOutlet weak var nameEffectImageView: UIImageView!
    
    @IBOutlet weak var sc: UIScrollView!
    
    var uv: UIView = UIView()
    var label: UILabel = UILabel()
    
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
        for i in 0..<6 {
            let button: UIButton = UIButton()
            button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
            button.tag = i+15
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            let buttonImage: UIImage = UIImage(named: String((i+14)+1))!
            button.setImage(buttonImage, for: UIControl.State.normal)
            uv.addSubview(button)
        }
        // scにuvを貼る
        sc.addSubview(uv)
        sc.contentSize = uv.bounds.size
    }
    
    @objc func tap(sender: UIButton) {
        // tagの番号によって，imageViewのimageをフィルターをつけたい
        nameEffectImageView.image = UIImage(named: String(sender.tag))
        
        label.removeFromSuperview()
        label = createLabel(text: "選手名だよ〜〜", font: UIFont.boldSystemFont(ofSize: 20))
        self.view.addSubview(label)
        
    }
    
    func createLabel(text: String, font: UIFont) -> UILabel{
        let label_line: UILabel = UILabel()
        label_line.text = text
        label_line.font = font
        
        label_line.frame = CGRect(x: 150, y: 410, width: 330, height: 60)

        return label_line
    }
}
