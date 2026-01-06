//
//  RandomViewController.swift
//  SeSAC260102
//
//  Created by 석민솔 on 1/2/26.
//

import UIKit

class RandomViewController: UIViewController {
    
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var randomButton: UIButton!
    
    let bigNumber = Int.random(in: 1...100)
    let nicknameList = ["jack", "bran", "hue", "starbucks", "mmamoth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        numberLabel.backgroundColor = .white
        numberLabel.text = "안녕하세요? How Are you?"
        numberLabel.numberOfLines = 0
        numberLabel.textColor = .black
        numberLabel.textAlignment = .center
        numberLabel.layer.borderColor = UIColor.black.cgColor
        numberLabel.layer.borderWidth = 3
        
        numberLabel.layer.cornerRadius = 30
        numberLabel.clipsToBounds = true
        
        randomButton.backgroundColor = UIColor(red: 1, green: 1, blue: 129/255, alpha: 1)
//        randomButton.layer.borderColor = UIColor.systemYellow.cgColor
//        randomButton.layer.borderWidth = 3
        randomButton.layer.cornerRadius = 30
        randomButton.tintColor = .systemBrown
        
        view.backgroundColor = UIColor.systemBrown
    }

    // touch up inside
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        print("버튼 출력된 거 맞나요?")
        
        numberLabel.text = nicknameList.randomElement()
        
//        let randomNumber = Int.random(in: 1...100)
//        numberLabel.text = "반갑습니다 \(randomNumber) \(bigNumber)"
    }
}
