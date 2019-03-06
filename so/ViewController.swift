//
//  ViewController.swift
//  so
//
//  Created by Spextrum on 19/02/19.
//  Copyright © 2019 Spextrum. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var textFiled1: UITextField!
    @IBOutlet weak var textFiled2: UITextField!
    @IBOutlet weak var textFiled3: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var selectedTextField:UITextField?
    
    var colorsArray = ["Blue", "Green", "Red", "White", "Grey"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFiled1.delegate = self
        textFiled2.delegate = self
        textFiled3.delegate = self
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let tempArr = colorsArray.filter { ![textFiled1.text!,textFiled2.text!,textFiled3.text!].contains($0) }
        return tempArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let tempArr = colorsArray.filter { ![textFiled1.text!,textFiled2.text!,textFiled3.text!].contains($0) }
        return tempArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let tempArr = colorsArray.filter { ![textFiled1.text!,textFiled2.text!,textFiled3.text!].contains($0) }
        self.selectedTextField?.text = tempArr[row]
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.selectedTextField = textField
        pickerView.reloadAllComponents()
    }
}
