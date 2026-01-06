//
//  EmotionViewController.swift
//  SeSACW1Assignment
//
//  Created by 석민솔 on 1/2/26.
//

import UIKit

class EmotionViewController: UIViewController {
    // buttons
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var fourthButton: UIButton!
    @IBOutlet var fifthButton: UIButton!
    @IBOutlet var sixthButton: UIButton!
    @IBOutlet var seventhButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    
    // labels
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var fourthLabel: UILabel!
    @IBOutlet var fifthLabel: UILabel!
    @IBOutlet var sixthLabel: UILabel!
    @IBOutlet var seventhLabel: UILabel!
    @IBOutlet var eightLabel: UILabel!
    @IBOutlet var nineLabel: UILabel!
    
    // images
    var emotionCountList: [Int] = {
        var tempList: [Int] = []
        for _ in 1...9 {
            tempList.append(0)
        }
        return tempList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // button image
        firstButton.setImage(getEmotion(of: firstButton).image, for: .normal)
        secondButton.setImage(getEmotion(of: secondButton).image, for: .normal)
        thirdButton.setImage(getEmotion(of: thirdButton).image, for: .normal)
        fourthButton.setImage(getEmotion(of: fourthButton).image, for: .normal)
        fifthButton.setImage(getEmotion(of: fifthButton).image, for: .normal)
        sixthButton.setImage(getEmotion(of: sixthButton).image, for: .normal)
        seventhButton.setImage(getEmotion(of: seventhButton).image, for: .normal)
        eightButton.setImage(getEmotion(of: eightButton).image, for: .normal)
        nineButton.setImage(getEmotion(of: nineButton).image, for: .normal)
        
        // label
        firstLabel.text = generateEmotionLabel(for: getEmotion(of: firstLabel))
        secondLabel.text = generateEmotionLabel(for: getEmotion(of: secondLabel))
        thirdLabel.text = generateEmotionLabel(for: getEmotion(of: thirdLabel))
        fourthLabel.text = generateEmotionLabel(for: getEmotion(of: fourthLabel))
        fifthLabel.text = generateEmotionLabel(for: getEmotion(of: fifthLabel))
        sixthLabel.text = generateEmotionLabel(for: getEmotion(of: sixthLabel))
        seventhLabel.text = generateEmotionLabel(for: getEmotion(of: seventhLabel))
        eightLabel.text = generateEmotionLabel(for: getEmotion(of: eightLabel))
        nineLabel.text = generateEmotionLabel(for: getEmotion(of: nineLabel))
    }

    private func generateEmotionLabel(for emotion: Emotion) -> String {
        return emotion.text + " " + String(describing: emotionCountList[emotion.rawValue])
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        let emotion = getEmotion(of: sender)
        
        emotionCountList[emotion.rawValue] += 1
        getLabel(of: emotion).text = generateEmotionLabel(for: emotion)
    }
    
    private func getEmotion(of button: UIButton) -> Emotion {
        switch button {
        case firstButton: .cold
        case secondButton: .drooling
        case thirdButton: .exploding
        case fourthButton: .kissing
        case fifthButton: .melting
        case sixthButton: .partying
        case seventhButton: .sleepy
        case eightButton: .sunglasses
        case nineButton: .tears
        default: .none
        }
    }
    
    private func getEmotion(of label: UILabel) -> Emotion {
        switch label {
        case firstLabel: .cold
        case secondLabel: .drooling
        case thirdLabel: .exploding
        case fourthLabel: .kissing
        case fifthLabel: .melting
        case sixthLabel: .partying
        case seventhLabel: .sleepy
        case eightLabel: .sunglasses
        case nineLabel: .tears
        default: .none
        }
    }
    
    private func getLabel(of emotion: Emotion) -> UILabel {
        switch emotion {
        case .cold: self.firstLabel
        case .drooling: self.secondLabel
        case .exploding: self.thirdLabel
        case .kissing: self.fourthLabel
        case .melting: self.fifthLabel
        case .partying: self.sixthLabel
        case .sleepy: self.seventhLabel
        case .sunglasses: self.eightLabel
        case .tears: self.nineLabel
        case .none: UILabel()
        }
    }
}
