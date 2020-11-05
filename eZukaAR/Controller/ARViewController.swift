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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let anchor = try? Ezuka01.loadSample() else { return }
        
        arView.scene.addAnchor(anchor)
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
