//
//  ProjectViewController.swift
//  eZukaAR
//
//  Created by Nanako Shimizu on 2020/11/10.
//


import UIKit
 
class ProjectViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Documentディレクトリにあるファイルの名前一覧を配列で取得
        let fileNames = getFileNmaes()
        // 配列に含まれる数を保持
        let numberOfFiles = fileNames.count
        // return images.count // 表示するセルの数
        return numberOfFiles
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録
        
        // Tag番号を使ってImageViewのインスタンス生成
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView

        let fileNames = getFileNmaes()
        // 画像を読み込む
        let cellImage = readImage(fileName: fileNames[indexPath.row])
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func readImage(fileName: String) -> UIImage?  {
        let documentsURL:URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // let cardName = "Test1.png"
        let fileURL:URL = documentsURL.appendingPathComponent(fileName)
        return UIImage(contentsOfFile: fileURL.path)
    }
    
    // Documentディレクトリ内のファイル名を取得
    func getFileNmaes() -> [String] {
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let contentUrls = try FileManager.default.contentsOfDirectory(at: documentDirectoryURL, includingPropertiesForKeys: nil)
            let files = contentUrls.map{$0.lastPathComponent}
            // print(files)
            return files
        } catch {
            print(error)
            return []
        }
    
    }
    
}
