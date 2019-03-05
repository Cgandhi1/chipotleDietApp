//
//  selectionViewController.swift
//  chipotleDiet
//
//  Created by  admin on 3/2/19.
//  Copyright © 2019  admin. All rights reserved.
//

import UIKit

class selectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //1. set up buttons/tableView
    @IBOutlet weak var refreshBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //2. create model object to reference later and variables from inputViewController
    let data = Data()
    //calories
    //carbs
    //fats
    //protein
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initialize corner radius to buttons
        refreshBtn.layer.cornerRadius = 26
        doneBtn.layer.cornerRadius = 26
    }
    
    //3. Setting up TableView header and cell methods
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data.items[indexPath.section][indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name: "AvenirNext-Bold", size: 19)
        cell.textLabel?.textColor = UIColor.init(red: CGFloat(0x26)/255.0, green: CGFloat(0x26)/255.0, blue: CGFloat(0x26)/255.0, alpha: 1)
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.init(red: CGFloat(0x55)/255.0, green: CGFloat(0x17)/255.0, blue: CGFloat(0x17)/255.0, alpha: 1)
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont(name: "AvenirNext-Bold", size: 29)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if selectedCell.layer.borderColor != UIColor.green.cgColor {
            selectedCell.layer.borderWidth = 4.31
            selectedCell.layer.borderColor = UIColor.green.cgColor
        } else {
            selectedCell.layer.borderWidth = 0
            selectedCell.layer.borderColor = nil
            }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

} //end of class
