//
//  UIView+ImageProcessing.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/13.
//

import UIKit

extension UIImage {

    /*
     画像をResizeするクラスメソッド.
     */
    class func ResizeUIImage(image : UIImage,width : CGFloat, height : CGFloat)-> UIImage!{

        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))

        // コンテキストに画像を描画する.
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))

        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        // コンテキストを閉じる.
        UIGraphicsEndImageContext()

        return newImage
    }

    /*
     画像を合成するクラスメソッド.
     */
    class func ComposeUIImage(UIImageArray : [UIImage], width: CGFloat, height : CGFloat)->UIImage!{

        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))

        // UIImageのある分回す.
        for image : UIImage in UIImageArray {

            // コンテキストに画像を描画する.
            image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        }

        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        // コンテキストを閉じる.
        UIGraphicsEndImageContext()

        return newImage
    }
}

