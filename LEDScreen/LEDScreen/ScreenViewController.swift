//
//  ScreenViewController.swift
//  LEDScreen
//
//  Created by 김가은 on 2022/06/22.
//

import UIKit

class ScreenViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentLabel.text = ""
        
        self.contentLabel.textColor = UIColor(red: 249/255, green: 255/255, blue: 201/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.shadowImage = .none
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        backBarButtonItem.tintColor = .darkGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentLabel.text
            settingViewController.textColor = self.contentLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentLabel.text = text
        }
        self.contentLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
//
//    @IBAction func SettingButtonClicked(_ sender: Any) {
//        guard let viewController = self.storyboard?.instantiateViewController(identifier: "SettingViewController") else { return }
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
    
}

