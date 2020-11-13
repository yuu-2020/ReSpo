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

class EditViewController: UIViewController {

    var editImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var effectImageView: UIImageView!
    @IBOutlet weak var themeSc: UIScrollView!
    @IBOutlet weak var menuSC: UIScrollView!
    
    var menuUv: UIView = UIView()
    var themeUv: UIView = UIView()
    
    var buttonNum: Int = 0
    
    var edit: editType = .theme
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        for i in 0 ..< 6 {
            
            let button: UIButton = UIButton()
            button.tag = i
            button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
            
            button.addTarget(self, action: #selector(themeTap), for: .touchUpInside)
            let buttonImage: UIImage = UIImage(named: String(i + 9))!
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
            for i in 0 ..< 6 {
                let button: UIButton = UIButton()
                button.tag = i
                button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
                button.addTarget(self, action: #selector(themeTap), for: .touchUpInside)
                let buttonImage: UIImage = UIImage(named: String(i + 9))!
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
        case 3:
            edit = .fontColor
        case 4:
            edit = .color
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
        
        if theme == 3 {
            label.frame = CGRect(x: -150, y: 100, width: 480, height: 60)
            label.transform = CGAffineTransform(rotationAngle: CGFloat(270 * CGFloat.pi / 180))
        } else if theme == 6 {
            label.frame = CGRect(x: 150, y: 410, width: 330, height: 60)
        } else if theme == 7 {
            label.frame = CGRect(x: 150, y: 410, width: 330, height: 60)
        }

        return label
    }

    @IBAction func theme3(_ sender: Any) {
        buttonNum = 3
        performSegue(withIdentifier: "toTheme3", sender: nil)
    }
    
    @IBAction func theme6(_ sender: Any) {
        buttonNum = 6
        performSegue(withIdentifier: "toTheme3", sender: nil)
    }
    
    @IBAction func theme7(_ sender: Any) {
        buttonNum = 7
        performSegue(withIdentifier: "toTheme3", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toTheme3") {
            let subVC: EditFontViewController = segue.destination as! EditFontViewController
            let playerTarget: CGRect = self.imageView.bounds
            let effectTarget: CGRect = self.effectImageView.bounds
            subVC.playerImage = imageView.screenShot(target: playerTarget)
            subVC.effectedImage = effectImageView.screenShot(target: effectTarget)
            subVC.buttonNum = buttonNum
        }
    }
    
}
