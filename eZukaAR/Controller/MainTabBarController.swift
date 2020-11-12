//
//  MainTabBarController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/07.
//

import UIKit

class MainTabBarController: UITabBarController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegate = self
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    // TabBarItemが選択された時に呼ばれる
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        // TabBarItemタップでModal表示をする画面を指定して実装
        if viewController is ARViewController {
            let storyboard: UIStoryboard = self.storyboard!
            let second = storyboard.instantiateViewController(withIdentifier: "ar")
            self.present(second, animated: true, completion: nil)
            return false
        }
        
        return true
    }
}
