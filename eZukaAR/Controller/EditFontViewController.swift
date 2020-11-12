//
//  EditFontViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/10.
//

import UIKit

extension UIImage {

    /*
     画像をResizeするクラスメソッド.
     */
    class func ResizeUIImage(image : UIImage,width : CGFloat, height : CGFloat)-> UIImage!{

        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))

        // コンテキストに画像を描画する.
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))

        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        // コンテキストを閉じる.
        UIGraphicsEndImageContext()

        return newImage
    }

    /*
     画像を合成するクラスメソッド.
     */
    class func ComposeUIImage(UIImageArray : [UIImage], width: CGFloat, height : CGFloat)->UIImage!{

        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))

        // UIImageのある分回す.
        for image : UIImage in UIImageArray {

            // コンテキストに画像を描画する.
            image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        }

        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        // コンテキストを閉じる.
        UIGraphicsEndImageContext()

        return newImage
    }
}


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
        // リサイズ
        let reImageView: UIImage = UIImage.ResizeUIImage(image: imageView.image! ,width: self.view.frame.maxX, height: self.view.frame.maxY)
        let reEffectImageView: UIImage = UIImage.ResizeUIImage(image: effectImageView.image! ,width: self.view.frame.maxX, height: self.view.frame.maxY)
        let reNameEffectImageView: UIImage = UIImage.ResizeUIImage(image: nameEffectImageView.image! ,width: self.view.frame.maxX, height: self.view.frame.maxY)
        
        // 画像を合成
        let composedImage = UIImage.ComposeUIImage(UIImageArray: [reImageView, reEffectImageView, reNameEffectImageView], width: self.view.frame.maxX, height: self.view.frame.maxY)
        
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
