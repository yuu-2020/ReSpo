//
//  SettingViewController.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/06.
//

import UIKit

var tableTitle = [["通知設定", "通知"],
                  ["言語", "表示言語"],
                  ["アカウント", "ID", "パスワード", "メールアドレス"],
                  ["連携", "VR"]]

var tableSubtitle = [["", "ON"],
                     ["", "日本語"],
                     ["", "MagTaro0829", "登録済み", "登録済み"],
                     ["", "連携済み"]]

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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

extension SettingViewController: UITableViewDelegate {
}

extension SettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableTitle[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
        
        cell.textLabel?.text = tableTitle[indexPath.section][indexPath.row + 1]
        cell.detailTextLabel?.text = tableSubtitle[indexPath.section][indexPath.row + 1]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitle[section][0]
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.init(displayP3Red: 56/255, green: 67/255, blue: 81/255, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
