//
//  EditViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/09.
//

import UIKit

enum editType: Int {
    case theme = 0
    case effect = 1
    case font = 2
    case fontColor = 3
    case color = 4
    case trimming = 5
}

class EditViewController: UIViewController, UITextFieldDelegate {

    var editImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var effectImageView: UIImageView!
    @IBOutlet weak var themeImageView: UIImageView!
    @IBOutlet weak var fontImageView: UIImageView!
    @IBOutlet weak var themeSc: UIScrollView!
    @IBOutlet weak var menuSC: UIScrollView!
    
    var menuUv: UIView = UIView()
    var themeUv: UIView = UIView()
    
    var buttonNum: Int = 0
    
    var edit: editType = .theme
    var themeNumber: Int = 0
    
    var label: UILabel = UILabel()
    
    var playerName: String = "Masuharu Taguchi"
  
    let textField: UITextField = UITextField()
  
    var font: UIFont = UIFont()
    var fontSize: CGFloat = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegeteを設定
        textField.delegate = self

        imageView.image = editImage
        
        // 位置とサイズを決める
        themeUv.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*2, height: 70)
        menuUv.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*2, height: 10)
        
        // メニューバーのボタン横幅
        var menuButtonWidth = 0
        
        // メニューバーの作成
        for i in 0 ..< 6 {
            var menuName: String = ""
            let button: UIButton = UIButton()
            
            button.tag = i
            
            switch i {
            case 0:
                menuName = "テーマ"
                menuButtonWidth = 100
            case 1:
                menuName = "エフェクト"
                menuButtonWidth = 100
            case 2:
                menuName = "フォント"
                menuButtonWidth = 100
            case 3:
                menuName = "文字カラー"
                menuButtonWidth = 100
            case 4:
                menuName = "カラー"
                menuButtonWidth = 100
            case 5:
                menuName = "トリミング"
                menuButtonWidth = 100
            default:
                print("ERROR")
            }
            
            button.titleLabel?.baselineAdjustment = .alignCenters
            button.setTitle(menuName, for: UIControl.State.normal)
            button.frame = CGRect(x: (i * menuButtonWidth), y: 0, width: menuButtonWidth, height: 30)
            button.addTarget(self, action: #selector(menuTap), for: .touchUpInside)
            
            menuSC.addSubview(button)
        }
        
        menuSC.addSubview(menuUv)
        menuSC.contentSize = menuUv.bounds.size
        
        // themeでスクロールバーを初期化
        for i in 0 ..< 10 {
            
            let button: UIButton = UIButton()
            button.tag = i
            button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
            
            button.addTarget(self, action: #selector(themeTap), for: .touchUpInside)
            let buttonImage: UIImage = UIImage(named: String(i + 10))!
            button.setImage(buttonImage, for: UIControl.State.normal)
            
            themeUv.addSubview(button)
        }

        themeSc.addSubview(themeUv)
        themeSc.contentSize = themeUv.bounds.size
    }
    
    @objc func menuTap(sender: UIButton) {
        switch sender.tag {
        case 0:
            edit = .theme
            removeAllSubviews(parentView: themeSc)
            removeAllSubviews(parentView: themeUv)
            for i in 0 ..< 10 {
                let button: UIButton = UIButton()
                button.tag = i
                button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
                button.addTarget(self, action: #selector(themeTap), for: .touchUpInside)
                let buttonImage: UIImage = UIImage(named: String(i + 10))!
                button.setImage(buttonImage, for: UIControl.State.normal)
                themeUv.addSubview(button)
            }
            
            themeSc.addSubview(self.themeUv)
            themeSc.contentSize = themeUv.bounds.size
        case 1:
            edit = .effect
            removeAllSubviews(parentView: themeSc)
            removeAllSubviews(parentView: themeUv)
            for i in 0 ..< 6 {
                let button: UIButton = UIButton()
                button.tag = i
                button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
                button.addTarget(self, action: #selector(effectTap), for: .touchUpInside)
                let buttonImage: UIImage = UIImage(named: String(i + 1))!
                button.setImage(buttonImage, for: UIControl.State.normal)
                themeUv.addSubview(button)
            }
            
            themeSc.addSubview(self.themeUv)
            themeSc.contentSize = themeUv.bounds.size
        case 2:
            edit = .font
            removeAllSubviews(parentView: themeSc)
            removeAllSubviews(parentView: themeUv)
            for i in 0 ..< 6 {
                let button: UIButton = UIButton()
                button.tag = i
                button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
                button.addTarget(self, action: #selector(fontTap), for: .touchUpInside)
                let buttonImage: UIImage = UIImage(named: String(i + 1000))!
                button.setImage(buttonImage, for: UIControl.State.normal)
                themeUv.addSubview(button)
            }
            themeSc.addSubview(self.themeUv)
            themeSc.contentSize = themeUv.bounds.size
        case 3:
            edit = .fontColor
            removeAllSubviews(parentView: themeSc)
            removeAllSubviews(parentView: themeUv)
            for i in 0 ..< 5 {
                let button: UIButton = UIButton()
                button.tag = i
                button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
                button.addTarget(self, action: #selector(fontColorTap), for: .touchUpInside)
                let buttonImage: UIImage = UIImage(named: String(i + 100))!
                button.setImage(buttonImage, for: UIControl.State.normal)
                themeUv.addSubview(button)
            }
            themeSc.addSubview(self.themeUv)
            themeSc.contentSize = themeUv.bounds.size
        case 4:
            edit = .color
            removeAllSubviews(parentView: themeSc)
            removeAllSubviews(parentView: themeUv)
            for i in 0 ..< 5 {
                let button: UIButton = UIButton()
                button.tag = i
                button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
                button.addTarget(self, action: #selector(themeColorTap), for: .touchUpInside)
                let buttonImage: UIImage = UIImage(named: String(i + 100))!
                button.setImage(buttonImage, for: UIControl.State.normal)
                themeUv.addSubview(button)
            }
            themeSc.addSubview(self.themeUv)
            themeSc.contentSize = themeUv.bounds.size
        case 5:
            edit = .trimming
        default:
            print("ERROR")
        }
    }
    
    @objc func effectTap(sender: UIButton) {
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
        default:
            break
        }
        
    }
    
    @objc func themeTap(sender: UIButton) {
        themeNumber = sender.tag
        switch themeNumber {
        case 0: // 透明
            themeImageView.image = nil
        case 1: // 右縦
            themeImageView.image = UIImage(named: "200")
        case 2: // 左縦
            themeImageView.image = UIImage(named: "300")
        case 3: // 上
            themeImageView.image = UIImage(named: "400")
        case 4: // 下
            themeImageView.image = UIImage(named: "500")
        case 5: // 下三角
            themeImageView.image = UIImage(named: "600")
        case 6: // 上下三角（下が太い）
            themeImageView.image = UIImage(named: "700")
        case 7: //　上下三角（上が太い）
            themeImageView.image = UIImage(named: "800")
        default:
            themeImageView.image = UIImage(named: "200")
        }
    }
    
    @objc func fontTap(sender: UIButton) {
        label.removeFromSuperview()
        switch sender.tag {
        case 0:
            fontSize = 30.0
            font = UIFont(name: .agencyFBBold, size: fontSize)
        case 1:
            fontSize = 22.0
            font = UIFont(name: .azoSansBold, size: fontSize)
        case 2:
            fontSize = 25.0
            font = UIFont(name: .bellMTItalic, size: fontSize)
        default:
            fontSize = 25.0
            font = UIFont.boldSystemFont(ofSize: fontSize)
        }
        label = createLabel(text: playerName, font: font, theme: themeNumber)
        self.view.addSubview(label)
    }
    
    @objc func fontColorTap(sender: UIButton) {
        switch sender.tag {
        case 0:
            label.textColor = UIColor.black
        case 1:
            label.textColor = UIColor.red
        case 2:
            label.textColor = UIColor.blue
        case 3:
            label.textColor = UIColor.green
        case 4:
            label.textColor = UIColor.yellow
        default:
            label.textColor = UIColor.black
        }
    }
    
    @objc func themeColorTap(sender: UIButton) {
        switch themeNumber {
        case 0:
            print("0")
        case 1:
            switch sender.tag {
            case 0: // 黒色
                themeImageView.image = UIImage(named: "200")
            case 1: // 赤色
                themeImageView.image = UIImage(named: "201")
            case 2: // 青色
                themeImageView.image = UIImage(named: "202")
            case 3:// 緑色
                themeImageView.image = UIImage(named: "203")
            case 4:// 黄色
                themeImageView.image = UIImage(named: "204")
            default:
                themeImageView.image = UIImage(named: "200")
            }
        case 2:
            switch sender.tag {
            case 0: // 黒色
                themeImageView.image = UIImage(named: "300")
            case 1: // 赤色
                themeImageView.image = UIImage(named: "301")
            case 2: // 青色
                themeImageView.image = UIImage(named: "302")
            case 3:// 緑色
                themeImageView.image = UIImage(named: "303")
            case 4:// 黄色
                themeImageView.image = UIImage(named: "304")
            default:
                themeImageView.image = UIImage(named: "300")
            }
        case 3:
            switch sender.tag {
            case 0: // 黒色
                themeImageView.image = UIImage(named: "400")
            case 1: // 赤色
                themeImageView.image = UIImage(named: "401")
            case 2: // 青色
                themeImageView.image = UIImage(named: "402")
            case 3:// 緑色
                themeImageView.image = UIImage(named: "403")
            case 4:// 黄色
                themeImageView.image = UIImage(named: "404")
            default:
                themeImageView.image = UIImage(named: "400")
            }
        case 4:
            switch sender.tag {
            case 0: // 黒色
                themeImageView.image = UIImage(named: "500")
            case 1: // 赤色
                themeImageView.image = UIImage(named: "501")
            case 2: // 青色
                themeImageView.image = UIImage(named: "502")
            case 3:// 緑色
                themeImageView.image = UIImage(named: "503")
            case 4:// 黄色
                themeImageView.image = UIImage(named: "504")
            default:
                themeImageView.image = UIImage(named: "500")
            }
        case 5:
            switch sender.tag {
            case 0: // 黒色
                themeImageView.image = UIImage(named: "600")
            case 1: // 赤色
                themeImageView.image = UIImage(named: "601")
            case 2: // 青色
                themeImageView.image = UIImage(named: "602")
            case 3:// 緑色
                themeImageView.image = UIImage(named: "603")
            case 4:// 黄色
                themeImageView.image = UIImage(named: "604")
            default:
                themeImageView.image = UIImage(named: "600")
            }
        case 6:
            switch sender.tag {
            case 0: // 黒色
                themeImageView.image = UIImage(named: "700")
            case 1: // 赤色
                themeImageView.image = UIImage(named: "701")
            case 2: // 青色
                themeImageView.image = UIImage(named: "702")
            case 3:// 緑色
                themeImageView.image = UIImage(named: "703")
            case 4:// 黄色
                themeImageView.image = UIImage(named: "704")
            default:
                themeImageView.image = UIImage(named: "700")
            }
        case 7:
            switch sender.tag {
            case 0: // 黒色
                themeImageView.image = UIImage(named: "800")
            case 1: // 赤色
                themeImageView.image = UIImage(named: "801")
            case 2: // 青色
                themeImageView.image = UIImage(named: "802")
            case 3:// 緑色
                themeImageView.image = UIImage(named: "803")
            case 4:// 黄色
                themeImageView.image = UIImage(named: "804")
            default:
                themeImageView.image = UIImage(named: "800")
            }
        default:
            themeImageView.image = UIImage(named: "200")
        }
    }
    
    func removeAllSubviews(parentView: UIView){
        let subviews = parentView.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    func createLabel(text: String, font: UIFont, theme: Int) -> UILabel{
        let label: UILabel = UILabel()
        label.text = text
        label.font = font
        
        print(theme)
        
        if theme == 2 {
            label.frame = CGRect(x: -150, y: 150, width: 480, height: 60)
            label.transform = CGAffineTransform(rotationAngle: CGFloat(270 * CGFloat.pi / 180))
        } else if theme == 4 {
            label.frame = CGRect(x: 120, y: 510, width: 330, height: 60)
        } else if theme == 5 {
            label.frame = CGRect(x: 120, y: 510, width: 330, height: 60)
        } else if theme == 6 {
            label.frame = CGRect(x: 120, y: 510, width: 330, height: 60)
        } else {
            label.frame = CGRect(x: 120, y: 510, width: 330, height: 60)
        }

        return label
    }
    
    // 画像を保存
    @IBAction func saveCard(_ sender: Any) {
        // カード保存時のファイル名を設定
        // リターン時に保存のアクションが実行される
        
        // ファーストレスポンダに設定
        textField.becomeFirstResponder()
        // 配置場所・サイズを設定
        textField.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 38)
        // プレースホルダを設定
        textField.placeholder = "ファイル名を入力"
        // キーボードタイプを指定
        textField.keyboardType = .default
        // 枠線のスタイルを設定
        textField.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        textField.returnKeyType = .done
        // テキストを全消去するボタンを表示
        textField.clearButtonMode = .always
        // UITextFieldを追加
        self.view.addSubview(textField)
        // デリゲートを指定
        textField.delegate = self
    }
    
    // UILabeを渡すとUIImageを返してくれる
    func getImage(from label:UILabel) -> UIImage? {
      UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0)
      defer{
          UIGraphicsEndImageContext()
      }
      label.drawHierarchy(in: label.bounds, afterScreenUpdates: true)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      return image
    }
    
    // 改行ボタンを押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return")
        
        // let cardName = cardCount.description + ".png"
        let cardName = textField.text!
        
        // 画像を合成するための配列
        var imageArray: [UIImage] = []
        
        // 画像サイズ
        // imageViewのサイズ（カードサイズ）を指定
        let frameWidth = self.imageView.image!.size.width
        let frameHeight = self.imageView.image!.size.height
        
        // リサイズ
        if let reImageViewImage = imageView.image,
           let reImage = UIImage.ResizeUIImage(image: reImageViewImage, width: frameWidth, height: frameHeight) {
            imageArray.append(reImage)
        }
        
        if let reEffectImageViewImage = effectImageView.image,
           let reEffectImage = UIImage.ResizeUIImage(image: reEffectImageViewImage, width: frameWidth, height: frameHeight) {
            imageArray.append(reEffectImage)
        }
        
        if let reThemeImageViewImage = themeImageView.image, let reThemeImage = UIImage.ResizeUIImage(image: reThemeImageViewImage, width: frameWidth, height: frameHeight) {
            imageArray.append(reThemeImage)
        }
        
        if let reFontImageViewImage = fontImageView.image,
           let reFontImage = UIImage.ResizeUIImage(image: reFontImageViewImage, width: frameWidth, height: frameHeight) {
            imageArray.append(reFontImage)
        }
        
        // UILabelをUIImageとして取得
        if let labelImage = getImage(from: label) {
            imageArray.append(labelImage)
        }
        
        // 画像を合成
        let composedImage = UIImage.ComposeUIImage(UIImageArray: imageArray, width: frameWidth, height: frameHeight)
        
        if let data = composedImage?.pngData() {
            //let cardName = "test"
            
            let filename = getDocumentsDirectory().appendingPathComponent(cardName + ".png")
            try? data.write(to: filename)
        }
        
        // ダイアログをつける
        
        //アラートのタイトル
        let dialog = UIAlertController(title: "画像を保存しました！", message: "作成した画像はプロジェクトからいつでも確認・編集できます．", preferredStyle: .alert)
        
        // 閉じたあとにナビゲーションコントローラの最初の画面に戻る
        let close = UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) in
            //実際の処理
            self.navigationController?.popToRootViewController(animated: true)
        })
        
        // ダイアログ
        dialog.addAction(close)
        //実際に表示させる
        self.present(dialog, animated: true, completion: nil)
        
        return true
    }

    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Clear")
        return true
    }

    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }

    // テキストフィールドでの編集が終了する直前での処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        return true
    }
    
    // UITextField以外をタップするとフィールドを閉じる
    // !! タッチイベント検出しているがフィールドが閉じてくれないバグ！
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch")
        textField.resignFirstResponder()
        //　view.endEditing(true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }    
}
