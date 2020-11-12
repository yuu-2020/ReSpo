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
            button.tag = i+9
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            let buttonImage: UIImage = UIImage(named: String((i+8)+1))!
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
        let label_column: UILabel = UILabel()
        label_column.text = text
        label_column.font = font
        
        label_column.frame = CGRect(x: -150, y: 100, width: 480, height: 60)
        label_column.transform = CGAffineTransform(rotationAngle: CGFloat(270 * CGFloat.pi / 180))

        return label_column
    }
    
    // 画像を保存
    @IBAction func saveCard(_ sender: Any) {
        // 画像を合成するための配列
        var imageArray: [UIImage] = []
        
        // 画像サイズ
        let frameWidth = self.view.frame.maxX
        let frameHeight = self.view.frame.maxY
        
        // リサイズ
        if let reImageViewImage = imageView.image,
           let reImage = UIImage.ResizeUIImage(image: reImageViewImage, width: frameWidth, height: frameHeight) {
            imageArray.append(reImage)
        }
        
        if let reEffectImageViewImage = effectImageView.image,
           let reEffectImage = UIImage.ResizeUIImage(image: reEffectImageViewImage, width: frameWidth, height: frameHeight) {
            imageArray.append(reEffectImage)
        }
        
        if let reNameEffectImageViewImage = nameEffectImageView.image,
           let reNameEffectImage = UIImage.ResizeUIImage(image: reNameEffectImageViewImage, width: frameWidth, height: frameHeight) {
            imageArray.append(reNameEffectImage)
        }
        
        // 画像を合成
        let composedImage = UIImage.ComposeUIImage(UIImageArray: imageArray, width: frameWidth, height: frameHeight)
        
        if let data = composedImage?.pngData() {
            let filename = getDocumentsDirectory().appendingPathComponent("test.png")
            try? data.write(to: filename)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}
