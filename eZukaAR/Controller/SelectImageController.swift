//
//  SelectImageController.swift
//  eZukaAR
//
//  Created by Nanako Shimizu on 2020/11/10.
//

import UIKit

class SelectImageController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    //storyboardと接続
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //PhotoLibraryにアクセスする処理。
    @IBAction func imageSetting(_ sender: UIButton) {
        let picker = UIImagePickerController() //アルバムを開く処理を呼び出す
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
        self.present(picker, animated: true, completion: nil)
    }
    
    // 画像が選択された時に呼ばれる
    func imagePickerController(_ picker: UIImagePickerController,  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage  //imageViewにカメラロールから選んだ画像を表示する
        }
        self.dismiss(animated: true)  //画像をImageViewに表示したらアルバムを閉じる
    }
   
    // 画像選択がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // segueが動作することをViewControllerに通知するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toEdit" {
            // 遷移先のViewControllerを取得
            let next = segue.destination as? EditViewController
            // 用意した遷移先の変数に値を渡す
            next?.editImage = self.imageView.image
        }
    }
    
    func segueToDesignCardController() {
        // 画面遷移実行
        performSegue(withIdentifier: "toEdit", sender: nil)
    }
    
}
