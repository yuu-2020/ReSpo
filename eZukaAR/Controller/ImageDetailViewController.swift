//
//  ImageDetailViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/09.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    // 選択した画像を保存する
    var selectImage: UIImage?
    // tabBarの位置情報
    var tabBarFrame: CGRect!
    // ナビゲーションバーの位置情報
    var navBarFrame: CGRect!
    // 見えてる・見えてないフラグ
    var barVisible: Bool = true
    
    /// - MARK : IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tapGes:UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectImage
        
        /// 以下タブバー，ナビゲーションバーの設定
        
        // デフォルトのタブ位置情報を保存
        tabBarFrame = (tabBarController?.tabBar.frame)!
        // デフォルトのナビゲーションバーの位置情報を保存
        navBarFrame = (navigationController?.navigationBar.frame)!
        
        tapGes.addTarget(self, action: #selector(ImageDetailViewController.tapped(_ :)))
        
        view.addGestureRecognizer(tapGes)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @objc func tapped(_ s:UITapGestureRecognizer) {

        UIView.animate(withDuration: 0.5, animations: {() -> Void in

            var frame = self.tabBarFrame
            var navFrame = self.navBarFrame

            if self.barVisible {
                // 隠す（不可視領域に追いやる）
                frame?.origin.y = (self.tabBarFrame?.origin.y)! + (self.tabBarFrame?.size.height)!
                self.tabBarController?.tabBar.frame = frame!
                
                // 20はステータスバーの高さ
                navFrame?.origin.y = (self.navBarFrame.origin.y) - (self.navBarFrame.size.height) - 20
                self.navigationController?.navigationBar.frame = navFrame!
                
            } else {
                // 出す（不可視領域から復帰させる）
                self.tabBarController?.tabBar.frame = self.tabBarFrame
                self.navigationController?.navigationBar.frame = navFrame!
            }

            // 見えてる・見えてないフラグの更新
            self.barVisible = (self.barVisible) ? false : true
        })

    }

    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "editview", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editview") {
            let subVC: EditViewController = segue.destination as! EditViewController
            
            subVC.editImage = selectImage
        }
    }
}
