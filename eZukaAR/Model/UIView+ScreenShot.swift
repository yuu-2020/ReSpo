//
//  UIView+ScreenShot.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/10.
//

import UIKit

/// UIView拡張(イメージ)
public extension UIView {

    // MARK: Public Methods

    /// ビュー→イメージに変換する
    ///
    /// サブビューもイメージ化される
    ///
    /// - Returns: 対象ビューのイメージ
    func screenShot(target: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(target.size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else {
            print("現在のコンテキストを取得できませんでした。")
            return UIImage()
        }

        context.translateBy(x: -target.minX, y: -target.minY) // ★一行追加
        self.layer.render(in: context)

        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            print("ビューをイメージに変換できませんでした。")
            return UIImage()
        }

        UIGraphicsEndImageContext()

        return image
    }

}
