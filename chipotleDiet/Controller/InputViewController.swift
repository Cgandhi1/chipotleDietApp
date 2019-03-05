//
//  InputViewController.swift
//  chipotleDiet
//
//  Created by  admin on 2/24/19.
//  Copyright © 2019  admin. All rights reserved.
//

import UIKit

//UITextfield extension for setting up the textfield components
extension UITextField {
    func set(bgColor: UIColor, placeholderTxt: String, placeholderColor: UIColor, txtColor: UIColor) {
        
        self.backgroundColor = bgColor
        self.attributedPlaceholder = NSAttributedString(string: placeholderTxt, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        self.textColor = txtColor
    }
}

//string extension to check for validation for each label
extension String {
    var checkForCalories: Bool {
        if UInt(self) != nil, UInt(self)! <= 6700 && UInt(self)! >= 150 {
            return true
        } else { return false }
    }
    
    var checkForCarbs: Bool {
        if UInt(self) != nil, UInt(self)! <= 800 && UInt(self)! >= 40 {
            return true
        } else { return false }
    }

    var checkForFats: Bool {
        if UInt(self) != nil, UInt(self)! <= 300 && UInt(self)! >= 0 {
            return true
        } else { return false }
    }

    var checkForProtein: Bool {
        if UInt(self) != nil, UInt(self)! <= 200 && UInt(self)! >= 0 {
            return true
        } else { return false }
    }
}

//validation enumeration
enum LoginError: Error {
    case incompleteForm
    case invalidInput
    case invalidLength
}

class InputViewController: UIViewController {
    
    //1. Data from ViewController
    var caloriesSelected: Bool = true
    
    //2. IBOutlet Btns and Labels
    @IBOutlet weak var inputName: UILabel!
    @IBOutlet weak var inputNameLbl: UITextField!
    @IBOutlet weak var inputCalories: UILabel!
    @IBOutlet weak var inputCaloriesLbl: UITextField!
    @IBOutlet weak var inputCarbs: UILabel!
    @IBOutlet weak var inputCarbsLbl: UITextField!
    @IBOutlet weak var inputFats: UILabel!
    @IBOutlet weak var inputFatsLbl: UITextField!
    @IBOutlet weak var inputProtein: UILabel!
    @IBOutlet weak var inputProteinLbl: UITextField!
    @IBOutlet weak var goBtn: UIButton!
    
    //3. Textfield Variables
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputNameLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Name Here", placeholderColor: UIColor.gray, txtColor: UIColor.black)
        inputNameLbl.borderStyle = UITextField.BorderStyle.roundedRect
        inputNameLbl.font = UIFont(name: "avenir next", size: 20)
        
        //SHOW CALORIES TEXTFIELD PROPERTIES IF USER SELECT CALORIES
        if caloriesSelected == true {
            
            
            inputCaloriesLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Calories Here", placeholderColor: UIColor.gray, txtColor: UIColor.black)
            inputCaloriesLbl.borderStyle = UITextField.BorderStyle.roundedRect
            inputCaloriesLbl.font = UIFont(name: "avenir next", size: 20)
            
            //HIDE CARBS,FATS,PROTEINS TEXTFIELD AND LABELS:
            inputCarbs.isHidden = true
            inputCarbsLbl.isHidden = true
            inputFats.isHidden = true
            inputFatsLbl.isHidden = true
            inputProtein.isHidden = true
            inputProteinLbl.isHidden = true
            
            
        } else {
            //SHOW MACROS TEXTFIELD PROPERTIES ONLY IF USER SELECTS MACROS
            //Carbs
            inputCarbsLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Carbs Here", placeholderColor: UIColor.gray, txtColor: UIColor.black)
            inputCarbsLbl.borderStyle = UITextField.BorderStyle.roundedRect
            inputCarbsLbl.font = UIFont(name: "avenir next", size: 20)
            
            //Fats
            inputFatsLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Fats Here", placeholderColor: UIColor.gray, txtColor: UIColor.black)
            inputFatsLbl.borderStyle = UITextField.BorderStyle.roundedRect
            inputFatsLbl.font = UIFont(name: "avenir next", size: 20)
            
            //Protein
            inputProteinLbl.set(bgColor: UIColor.white, placeholderTxt: "Input Protein Here", placeholderColor: UIColor.gray, txtColor: UIColor.black)
            inputProteinLbl.borderStyle = UITextField.BorderStyle.roundedRect
            inputProteinLbl.font = UIFont(name: "avenir next", size: 20)
            
            //HIDE CALORIES:
            inputCalories.isHidden = true
            inputCaloriesLbl.isHidden = true
        }
        
        //SET GO BTN RADIUS
        goBtn.layer.cornerRadius = 32
        // Do any additional setup after loading the view.
        
        self.navigationItem.titleView = setTitle(title: "CHIPOTLE", subtitle: "DIET APP")
        
    } //end of viewDidLoad
        
    
    
    //4. Go Button method with DO CATCH TRY
    @IBAction func goBtnPressed(_ sender: UIButton) {
        
        do {
            
            try go()
            
        //7.5 caching enumeration error and displaying alert
        } catch LoginError.incompleteForm {
            
            if caloriesSelected == true {
            Alert.showBasic(title: "Incomplete Form", message: "Please enter Calories", vc: self)
        } else {
            Alert.showBasic(title: "Incomplete Form", message: "Please enter Carbs, Fats, and Protein", vc: self)
            }
            
        } catch LoginError.invalidInput {
            
            if caloriesSelected == true {
                Alert.showBasic(title: "Invalid Input", message: "Please only enter numbers, \nCalories Range: 150-6700", vc: self)
            } else {
                Alert.showBasic(title: "Invalid Input", message: "Please only enter numbers, \nCarbs Range: 40-800, \nFats Range: 0-300, \nProtein Range: 0-200", vc: self)
                
            }
        } catch LoginError.invalidLength {
            Alert.showBasic(title: "Invalid Length", message: "Max Length: \n26 Characters", vc: self)
        } catch {
            Alert.showBasic(title: "Unable To Login", message: "There was an error attempting to login", vc: self)
        }
        
    }
    
    //5. Go Method
    func go() throws {
        
        //6. setting labels to variables
        let checkInputName: String = inputNameLbl.text!
        let checkCaloriesInput: String = inputCaloriesLbl.text!
        let checkCarbsInput: String = inputCarbsLbl.text!
        let checkFatsInput: String = inputFatsLbl.text!
        let checkProteinInput: String = inputProteinLbl.text!
        if checkInputName.count > 26 {
            throw LoginError.invalidLength
        }
        
        //7. checking entries for calories
        if caloriesSelected == true {
            if checkCaloriesInput.isEmpty {
                throw LoginError.incompleteForm
            }
            if checkCaloriesInput.checkForCalories == false {
                throw LoginError.invalidInput
            }
        }
        
        //7. checking entries for macros
        if caloriesSelected == false {
            if checkCarbsInput.isEmpty || checkFatsInput.isEmpty || checkProteinInput.isEmpty {
                throw LoginError.incompleteForm
            }
            if checkCarbsInput.checkForCarbs == false || checkFatsInput.checkForFats == false || checkProteinInput.checkForProtein == false {
                throw LoginError.invalidInput
            }
        }
        
        //8. if everything is success, perform segue
        performSegue(withIdentifier: "toSelectionVC", sender: self)
        
        }
    
    //9. preparing for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSelectionVC" {
            let thirdVC = segue.destination as! selectionViewController
            //!!send over inputted calories and macronutrient variables here
        }
    }
    
    
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
    
    
    } //end of class

