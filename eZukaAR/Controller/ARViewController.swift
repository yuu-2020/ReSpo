//
//  ARViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/06.
//

import UIKit
import ARKit
import RealityKit

class ARViewController: UIViewController {

    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var homeButton: UIButton!
    
    // カメラやマイクの入出力を管理するオブジェクトを生成
    private let session = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let anchor = try? EzukaMain.loadMain() else { return }
        
        arView.scene.addAnchor(anchor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // QRコードリーダを呼び出し
    @IBAction func shareBottunPressed(_ sender: Any) {
        self.present(QRScannerController(), animated: true, completion: nil)
    }
}
