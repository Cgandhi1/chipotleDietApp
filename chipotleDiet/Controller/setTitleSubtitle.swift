//
//  setTitleSubtitle.swift
//  chipotleDiet
//
//  Created by  admin on 3/4/19.
//  Copyright © 2019  admin. All rights reserved.
//

import UIKit


struct setTitleSubTitle {
    
    //Setting Title and Subtitle
    func setTitle(title:String, subtitle:String) -> UIView {
        
        //Get navigation Bar Height and Width
        let navigationBarHeight = Int(self.navigationController!.navigationBar.frame.height)
        let navigationBarWidth = Int(self.navigationController!.navigationBar.frame.width)
        
        //Y position for Title and Subtitle
        var y_Title = 0.0
        var y_SubTitle = 0.0
        
        //Set Y position
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            //If screen height equal iPhone 5S and SE
            case 1136:
                y_Title = 46
                y_SubTitle = 36
                print("iPhone 5S and SE")
            //If screen height equal iPhone 6, 6+, 6S, 6S+, 7, 7+, 8, 8+ and X
            case 1334, 1920, 2208, 2436:
                y_Title = 48
                y_SubTitle = 38
                print("iPhone 6, 6+, 6S, 6S+, 7, 7+, 8, 8+ and X")
            default:
                y_Title = 46
                y_SubTitle = 36
                print("Default")
            }
        }
        
        
        let titleFont = UIFont(name: "GillSans", size: 19)!
        let subtitleFont = UIFont(name: "AvenirNext-Bold", size: 30)!
        
        let screenRect = UIScreen.main.bounds
        let screenWidth = Double(screenRect.size.width)
        let screenHeight = Double(screenRect.size.height)
        
        
        //Title label
        let titleLabel = UILabel(frame: CGRect(x: screenWidth/2 - 86.67/2, y: y_SubTitle, width: 0, height: 0))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.init(red: CGFloat(0x6A)/255.0, green: CGFloat(0x6A)/255.0, blue: CGFloat(0x6A)/255.0, alpha: 1)
        titleLabel.font = titleFont
        titleLabel.text = title
        let titleWidth = Double(titleLabel.intrinsicContentSize.width)
        let titleHeight = Double(titleLabel.intrinsicContentSize.height)
        print(titleWidth)
        titleLabel.sizeToFit()
        
        //SubTitle label
        var subtitleLabel = UILabel(frame: CGRect(x: screenWidth/2 - 135.0/2, y: y_Title + 10, width: 0, height: 0))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.init(red: CGFloat(0x2E)/255.0, green: CGFloat(0x2E)/255.0, blue: CGFloat(0x2E)/255.0, alpha: 1)
        subtitleLabel.font = subtitleFont
        subtitleLabel.text = subtitle
        let subtitleWidth = Double(subtitleLabel.intrinsicContentSize.width)
        let subtitleHeight = Double(subtitleLabel.intrinsicContentSize.height)
        print(subtitleWidth)
        subtitleLabel.sizeToFit()
        
        
        //Add Title and Subtitle to View
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: navigationBarWidth, height: navigationBarHeight))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        
        return titleView
        
    }
    
    
}
