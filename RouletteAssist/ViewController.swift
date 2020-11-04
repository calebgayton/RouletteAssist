//
//  ViewController.swift
//  RouletteAssist
//
//  Created by Caleb Gayton on 11/3/20.
//  Copyright © 2020 Caleb Gayton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var moveSpaces: UIPickerView!
    
    @IBOutlet weak var recentNumber: UIPickerView!
    
    @IBOutlet weak var leftNumbers: UILabel!
    
    @IBOutlet weak var rightNumbers: UILabel!
    
    @IBAction func pushButton(_ sender: Any) {
        findAdjacent()
    }
    
    var selMoveSpaces: String = "1"
    var selRecentNumber: String = "0"
    
    let allNumberData: [String] = ["0","000","00","32","15","19","4","21","2","25","17","34","6","27","13","36","11","30","8","23","10","5","24","16","33","1","20","14","31","9","22","18","29","7","28","12","35","3","26"]
    
    let recentNumberData: [String] = ["0","00","000","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36"]
    
    let moveSpaceData: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.moveSpaces.delegate = self
        self.moveSpaces.dataSource = self
        
        self.recentNumber.delegate = self
        self.recentNumber.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case moveSpaces:
            return moveSpaceData.count
        case recentNumber:
            return recentNumberData.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case moveSpaces:
            return moveSpaceData[row]
        case recentNumber:
            return recentNumberData[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case moveSpaces:
            selMoveSpaces = moveSpaceData[row]
        case recentNumber:
            selRecentNumber = recentNumberData[row]
        default:
            break
        }
    }
    
    func findAdjacent() {
        //create list to store current number
        let curAdj: [String] = [selRecentNumber]
        //create new lists to store adjacent numbers
        var leftAdj: [String] = []
        var rightAdj: [String] = []
        //get current position of entered number
        var index = allNumberData.firstIndex(of: selRecentNumber)
        //loop through list to find adjacent numbers (left side)
        while !(leftAdj.count == Int(selMoveSpaces)) {
            //check if index has reached the beginning of list
            if index == 0 {
                index = allNumberData.count
            }
            //add adjacent number to left side list
            leftAdj.insert(allNumberData[index! - 1], at: 0)
            //decrement index counter
            index! -= 1
        }
        //get current position of entered number
        index = allNumberData.firstIndex(of: selRecentNumber)
        //loop through list to find adjacent numbers (right side)
        while !(rightAdj.count == Int(selMoveSpaces)) {
            //check if index has reached the end of list
            if index == allNumberData.count {
                //reset index to beginning of list
                index = -1
            }
            //add adjacent number to right side list
            rightAdj.append(allNumberData[index! + 1])
            //increment index counter
            index! += 1
        }
        
        leftNumbers.text = leftAdj.joined(separator:"-")
        rightNumbers.text = rightAdj.joined(separator: "-")
    }
    
}

