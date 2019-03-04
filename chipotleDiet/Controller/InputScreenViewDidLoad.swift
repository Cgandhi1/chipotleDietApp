//
//  InputScreenViewDidLoad.swift
//  chipotleDiet
//
//  Created by  admin on 2/24/19.
//  Copyright © 2019  admin. All rights reserved.
//

import Foundation


func onViewDidLoad {
    //INPUT NAME TEXTFIELD
    inputNameLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Name", placeholderColor: UIColor.gray, txtColor: UIColor.black)
    inputNameLbl.borderStyle = UITextField.BorderStyle.roundedRect
    
    //SHOW CALORIES
    if caloriesSelected == true {
    //Calories
    inputCaloriesLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Calories", placeholderColor: UIColor.gray, txtColor: UIColor.black)
    inputCaloriesLbl.borderStyle = UITextField.BorderStyle.roundedRect
    
    //HIDE CARBS,FATS,PROTEINS TEXTFIELD AND LABELS:
    inputCarbs.isHidden = true
    inputCarbsLbl.isHidden = true
    inputFats.isHidden = true
    inputFatsLbl.isHidden = true
    inputProtein.isHidden = true
    inputProteinLbl.isHidden = true
    
    } else {
    //Carbs
    inputCarbsLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Carbs", placeholderColor: UIColor.gray, txtColor: UIColor.black)
    inputCarbsLbl.borderStyle = UITextField.BorderStyle.roundedRect
    
    //Fats
    inputFatsLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Fats", placeholderColor: UIColor.gray, txtColor: UIColor.black)
    inputFatsLbl.borderStyle = UITextField.BorderStyle.roundedRect
    
    //Protein
    inputProteinLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Protein", placeholderColor: UIColor.gray, txtColor: UIColor.black)
    inputProteinLbl.borderStyle = UITextField.BorderStyle.roundedRect
    
    //HIDE CALORIES:
    inputCalories.isHidden = true
    inputCaloriesLbl.isHidden = true
    
    }
    
    //SET GO BTN RADIUS
    goBtn.layer.cornerRadius = 32
    // Do any additional setup after loading the view.
}
