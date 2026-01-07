//
//  EmotionViewController.swift
//  SeSACW1Assignment
//
//  Created by 석민솔 on 1/2/26.
//

import UIKit

class EmotionViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var labels: [UILabel]!
    
    var emotionCountList: [Int] = {
        var tempList: [Int] = []
        for _ in 1...9 {
            tempList.append(0)
        }
        return tempList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAllButtonDesign()
        setAllLabelDesign()
    }
    
    private func setAllButtonDesign() {
        for button in buttons {
            let index = buttons.firstIndex(of: button)!
            let image = UIImage(named: Emotion(rawValue: index)!.imageName)
            button.setImage(image, for: .normal)
        }
    }
    
    private func setAllLabelDesign() {
        for label in labels {
            let index = labels.firstIndex(of: label)!
            label.text = generateEmotionLabel(for: Emotion(rawValue: index)!)
        }

    }

    private func generateEmotionLabel(for emotion: Emotion) -> String {
        return emotion.text + " " + String(describing: emotionCountList[emotion.rawValue])
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        if let emotion = Emotion(rawValue: sender.tag) {
            
            emotionCountList[emotion.rawValue] += 1
            labels[emotion.rawValue].text = generateEmotionLabel(for: emotion)
        }
    }
}
