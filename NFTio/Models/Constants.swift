//
//  Constants.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import Foundation
import SwiftUI

enum Constants {
  enum General {
    public static let strokeWidth = CGFloat(2.0)
    public static let roundedViewLength = CGFloat(36.0)
    public static let roundedViewHeight = CGFloat(36.0)
    
    public static let roundedRectViewWidth = CGFloat(68.0)
    public static let roundedRectViewHeight = CGFloat(56.0)
    public static let roundedRectCornerRadius = CGFloat(28.0)
  }
  
  enum imageFileNames {
    public static let onboardingBackground = "onboarding-background"
    public static let appIcon = "app-icon"
  }
  
  enum colors {
    public static let primary = "Violet"
    public static let primaryText = "TextColor"
    public static let buttonBorderGradientColors = [
      Color(red: 230.0/255.0, green: 4.0/255.0, blue: 4.0/255.0),
      Color(red: 251.0/255.0, green: 21.0/255.0, blue: 242.0/255.0),
      Color(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0),
      Color(red: 23.0/255.0, green: 255.0/255.0, blue: 213.0/255.0),
      Color(red: 115.0/255.0, green: 249.0/255.0, blue: 10.0/255.0),
      Color(red: 239.0/255.0, green: 219.0/255.0, blue: 34.0/255.0)
    ]
    public static let buttonBackgroundGradientColors = [
      Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.4),
      Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)
    ]
  }
}
