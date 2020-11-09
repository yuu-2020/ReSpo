//
//  ARImageSelectViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/03.
//

import UIKit

class ARImageSelectViewController: UIViewController{
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    // サンプルイメージ
    var sampleImage = UIImage(named: "BasketCard_edit")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = sampleImage
    }
    
    @IBAction func imageTapped(_ sender: Any) {
        performSegue(withIdentifier: "detailview", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailview") {
            let subVC: ImageDetailViewController = segue.destination as! ImageDetailViewController
            
            subVC.selectImage = sampleImage
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
