//
//  ViewController.swift
//  QuoteGenerator
//
//  Created by 김가은 on 2022/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.quoteLabel.text = "아직 생성된 명언이 없습니다."
        self.authorLabel.text = ""
    }
    
    @IBAction func CreateButtonClicked(_ sender: Any) {
        let randomNumber = Int.random(in: 0...quotes.count-1)
        self.quoteLabel.text = quotes[randomNumber].contents
        self.authorLabel.text = quotes[randomNumber].author
    }
}

