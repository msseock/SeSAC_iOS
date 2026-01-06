//
//  EmotionViewController.swift
//  SeSAC260102
//
//  Created by 석민솔 on 1/6/26.
//

import UIKit

class EmotionViewController: UIViewController {

    // MARK: - emotion properties
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var emotionLabel: [UILabel]!
    
    let emotion = ["행복해", "우울해", "신기해"]
    var count = [0, 0, 0]
    
    
    // MARK: - age properties
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var ageButton: UIButton!
    @IBOutlet var ageLabel: UILabel!
    
    var example: String? = "13a"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstButton.tag = 0
        secondButton.tag = 1
        thirdButton.tag = 2
        
        emotionLabel[0].text = emotion[0]
        emotionLabel[1].text = emotion[1]
        emotionLabel[2].text = emotion[2]
        
        print(example)
    }

    // emotion
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        count[sender.tag] += 1

        print("\(emotion[sender.tag]) \(count[sender.tag])")
        
        let a = "\(emotion[sender.tag]) \(count[sender.tag])"
        emotionLabel[sender.tag].text = a
    }
    
    // age
    @IBAction func ageButtonTapped(_ sender: UIButton) {
        
        // optional force unwrapping
        if ageTextField.text == nil {
            print("입력된 텍스트가 없습니다")
        } else {
            if Int(ageTextField.text!) == nil {
                print("텍스트필드 글자가 문자네요")
            } else {
                print("당신은 \(Int(ageTextField.text!)!)살입니다.")
            }
        }
        
        // optional binding
        // 글자가 nil이 아닌 경우에만 userText에 담음
        if let userText = ageTextField.text, let intText = Int(userText) {
            print("당신은 \(intText)살입니다.")
        } else {
            print("숫자를 입력해주세요")
        }
    }
}
