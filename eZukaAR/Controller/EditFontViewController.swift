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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = playerImage
        effectImageView.image = effectedImage
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
