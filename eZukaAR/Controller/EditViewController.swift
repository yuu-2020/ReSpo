//
//  EditViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/09.
//

import UIKit

class EditViewController: UIViewController {

    var editImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var effectImageView: UIImageView!
    @IBOutlet weak var sc: UIScrollView!
    
    var uv: UIView = UIView()
    
    var buttonNum: Int = 0
    
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
        
        if (segue.identifier == "toTheme6") {
            let subVC: EditFontViewController6 = segue.destination as! EditFontViewController6
            let playerTarget: CGRect = self.imageView.bounds
            let effectTarget: CGRect = self.effectImageView.bounds
            subVC.playerImage = imageView.screenShot(target: playerTarget)
            subVC.effectedImage = effectImageView.screenShot(target: effectTarget)
        }
        
        if (segue.identifier == "toTheme7") {
            let subVC: EditFontViewController7 = segue.destination as! EditFontViewController7
            let playerTarget: CGRect = self.imageView.bounds
            let effectTarget: CGRect = self.effectImageView.bounds
            subVC.playerImage = imageView.screenShot(target: playerTarget)
            subVC.effectedImage = effectImageView.screenShot(target: effectTarget)
        }
    }
    
}
