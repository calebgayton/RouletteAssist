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
        
    }
    
    var selMoveSpaces: String = ""
    var selRecentNumber: String = ""
    
    let allNumberData: [String] = ["0","000","00","32","15","19","4","21","2","25","17","34","6","27","13","36","11","30","8","23","10","5","24","16","33","1","20","14","31","9","22","18","29","7","28","12","35","3","26"]
    
    let recentNumberData: [String] = ["0","00","000","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36"]
    
    let moveSpaceData: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"]
    
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
    
    func findAdjacent(move: Int) {
        
//        //create list to store current number
//        var curAdj: [String] = [recentNumber]
//        //create new lists to store adjacent numbers
//        leftAdj = list(())
//        rightAdj = list(())
//        //get current position of entered number
//        index = allNumbers.index(curNumber)
//        //loop through list to find adjacent numbers (left side)
//        while not len(leftAdj) == moveSpaces:
//        //check if index has reached the beginning of list
//        if index == 0:
//        //reset index to end of list
//        index = len(allNumbers)
//        //add adjacent number to left side list
//        leftAdj.insert(0, allNumbers[index - 1])
//        //decrement index counter
//        index-=1
//        //get current position of entered number
//        index = allNumbers.index(curNumber)
//        //loop through list to find adjacent numbers (right side)
//        while not len(rightAdj) == moveSpaces:
//        //check if index has reached the end of list
//        if index == len(allNumbers) - 1:
//        //reset index to beginning of list
//        index = -1
//        //add adjacent number to right side list
//        rightAdj.append(allNumbers[index + 1])
//        //increment index counter
//        index+=1
//
//        return leftAdj+curAdj+rightAdj
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.moveSpaces.delegate = self
        self.moveSpaces.dataSource = self
        
        self.recentNumber.delegate = self
        self.recentNumber.dataSource = self
        
    }
    
    
}

