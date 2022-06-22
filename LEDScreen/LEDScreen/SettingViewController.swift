//
//  SettingViewController.swift
//  LEDScreen
//
//  Created by 김가은 on 2022/06/22.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var contentTextField: UITextField!
    
    @IBOutlet weak var textColorButton1: UIButton!
    @IBOutlet weak var textColorButton2: UIButton!
    @IBOutlet weak var textColorButton3: UIButton!
    
    @IBOutlet weak var backgroundColorButton1: UIButton!
    @IBOutlet weak var backgroundColorButton2: UIButton!
    @IBOutlet weak var backgroundColorButton3: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var textColor = UIColor(red: 249/255, green: 255/255, blue: 201/255, alpha: 1.0)
    var backgroundColor: UIColor = .black
    var ledText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ledText = self.ledText {
            self.contentTextField.text = ledText
        }
        self.changeTextColor(color: UIColor(red: 249/255, green: 255/255, blue: 201/255, alpha: 1.0))
        self.changeBackgroundColor(color: .black)
    }

    @IBAction func TapTextColorButton(_ sender: UIButton) {
        if sender == self.textColorButton1 {
            self.changeTextColor(color: UIColor(red: 249/255, green: 255/255, blue: 201/255, alpha: 1.0))
            self.textColor = UIColor(red: 249/255, green: 255/255, blue: 201/255, alpha: 1.0)
        } else if sender == self.textColorButton2 {
            self.changeTextColor(color: UIColor(red: 216/255, green: 223/255, blue: 255/255, alpha: 1.0))
            self.textColor = UIColor(red: 216/255, green: 223/255, blue: 255/255, alpha: 1.0)
        } else {
            self.changeTextColor(color: UIColor(red: 255/255, green: 231/255, blue: 209/255, alpha: 1.0))
            self.textColor = UIColor(red: 255/255, green: 231/255, blue: 209/255, alpha: 1.0)
        }
    }
    
    @IBAction func TapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.backgroundColorButton1 {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.backgroundColorButton2 {
            self.changeBackgroundColor(color: .darkGray)
            self.backgroundColor = .darkGray
        } else {
            self.changeBackgroundColor(color: .lightGray)
            self.backgroundColor = .lightGray
        }
    }
    
    @IBAction func TapSaveButton(_ sender: Any) {
        self.delegate?.changedSetting(
            text: self.contentTextField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        self.textColorButton1.alpha = color == UIColor(red: 249/255, green: 255/255, blue: 201/255, alpha: 1.0) ? 1 : 0.2
        self.textColorButton2.alpha = color == UIColor(red: 216/255, green: 223/255, blue: 255/255, alpha: 1.0) ? 1 : 0.2
        self.textColorButton3.alpha = color == UIColor(red: 255/255, green: 231/255, blue: 209/255, alpha: 1.0) ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.backgroundColorButton1.alpha = color == UIColor.black ? 1 : 0.2
        self.backgroundColorButton2.alpha = color == UIColor.darkGray ? 1 : 0.2
        self.backgroundColorButton3.alpha = color == UIColor.lightGray ? 1 : 0.2
    }
}

