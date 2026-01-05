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
        firstButton.setImage(emotion(rawValue: 0)?.image, for: .normal)

        secondButton.setImage(emotion(rawValue: 1)?.image, for: .normal)
        thirdButton.setImage(emotion(rawValue: 2)?.image, for: .normal)
        fourthButton.setImage(emotion(rawValue: 3)?.image, for: .normal)
        fifthButton.setImage(emotion(rawValue: 4)?.image, for: .normal)
        sixthButton.setImage(emotion(rawValue: 5)?.image, for: .normal)
        seventhButton.setImage(emotion(rawValue: 6)?.image, for: .normal)
        eightButton.setImage(emotion(rawValue: 7)?.image, for: .normal)
        nineButton.setImage(emotion(rawValue: 8)?.image, for: .normal)

        // label
        firstLabel.text = generateEmotionLabel(for: 0)
        secondLabel.text = generateEmotionLabel(for: 1)
        thirdLabel.text = generateEmotionLabel(for: 2)
        fourthLabel.text = generateEmotionLabel(for: 3)
        fifthLabel.text = generateEmotionLabel(for: 4)
        sixthLabel.text = generateEmotionLabel(for: 5)
        seventhLabel.text = generateEmotionLabel(for: 6)
        eightLabel.text = generateEmotionLabel(for: 7)
        nineLabel.text = generateEmotionLabel(for: 8)
    }

    private func generateEmotionLabel(for index: Int) -> String {
        return emotion(rawValue: index)!.text + " " + String(describing: emotionCountList[index])
    }
    
    
    
    @IBAction func firstPushed(_ sender: UIButton) {
        emotionCountList[0] += 1
        firstLabel.text = generateEmotionLabel(for: 0)
    }
    @IBAction func secondPushed(_ sender: UIButton) {
        emotionCountList[1] += 1
        secondLabel.text = generateEmotionLabel(for: 1)
    }
    @IBAction func thirdPushed(_ sender: UIButton) {
        emotionCountList[2] += 1
        thirdLabel.text = generateEmotionLabel(for: 2)
    }
    @IBAction func fourthPushed(_ sender: UIButton) {
        emotionCountList[3] += 1
        fourthLabel.text = generateEmotionLabel(for: 3)
    }
    @IBAction func fifthPushed(_ sender: UIButton) {
        emotionCountList[4] += 1
        fifthLabel.text = generateEmotionLabel(for: 4)
    }
    @IBAction func sixthPushed(_ sender: UIButton) {
        emotionCountList[5] += 1
        sixthLabel.text = generateEmotionLabel(for: 5)
    }
    @IBAction func seventhPushed(_ sender: UIButton) {
        emotionCountList[6] += 1
        seventhLabel.text = generateEmotionLabel(for: 6)
    }


    @IBAction func eightPushed(_ sender: UIButton) {
        emotionCountList[7] += 1
        eightLabel.text = generateEmotionLabel(for: 7)
    }

    @IBAction func ninePushed(_ sender: UIButton) {
        emotionCountList[8] += 1
        nineLabel.text = generateEmotionLabel(for: 8)
    }
}

enum emotion: Int {
    case cold
    case drooling
    case exploding
    case kissing
    case melting
    case partying
    case sleepy
    case sunglasses
    case tears
    
    var image: UIImage {
        switch self {
        case .cold:
            UIImage.cold
        case .drooling:
            UIImage.drooling
        case .exploding:
            UIImage.exploding
        case .kissing:
            UIImage.kissing
        case .melting:
            UIImage.melting
        case .partying:
            UIImage.partying
        case .sleepy:
            UIImage.sleepy
        case .sunglasses:
            UIImage.sunglasses
        case .tears:
            UIImage.tears
        }
    }
    
    var text: String {
        switch self {
        case .cold:
            "추워"
        case .drooling:
            "맛있어"
        case .exploding:
            "머리터져"
        case .kissing:
            "히히"
        case .melting:
            "죽겠다"
        case .partying:
            "신나"
        case .sleepy:
            "졸려"
        case .sunglasses:
            "멋져"
        case .tears:
            "삥삥"
        }
    }

}
