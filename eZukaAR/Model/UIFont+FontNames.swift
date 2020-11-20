//
//  UIFont+FontNames.swift
//  eZukaAR
//
//  Created by AsanoYudai on 2020/11/13.
//
import UIKit

extension UIFont {
      convenience init(name: FontNames, size: CGFloat) {
          self.init(name: name.rawValue, size: size)!
      }
  }

  public enum FontNames: String {
      case agencyFBBold = "AgencyFB-Bold"
      case azoSansBold = "AzoSans-Bold"
      case bellMTItalic = "BellMTItalic"
  }
