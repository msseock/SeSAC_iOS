//
//  ViewController.swift
//  BMICalculator
//
//  Created by 석민솔 on 1/8/26.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var guideLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    @IBOutlet var heightTextfieldView: UIView!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var weightTextfieldView: UIView!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var checkResultButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setGuideLabelDesign()
        setResultLabelDesign()
        setTextFieldViewsDesign()
        setCheckResultButtonDesign()
    }

}

// MARK: - UI settings
extension ViewController {
    private func setGuideLabelDesign() {
        guideLabel.text = "당신의 BMI 지수를\n알려드릴게요."
        guideLabel.numberOfLines = 0
        guideLabel.font = .systemFont(ofSize: 13)
    }
    
    private func setResultLabelDesign() {
        resultLabel.text = ""
        errorLabel.text = ""
    }
    
    private func setTextFieldViewsDesign() {
        // heightTextfield
        heightTextfieldView.layer.cornerRadius = 16
        heightTextfieldView.layer.borderWidth = 1.5
        heightTextfieldView.layer.borderColor = UIColor.black.cgColor
        
        heightTextField.borderStyle = .none
        heightTextField.keyboardType = .decimalPad
        
        // weightTextfield
        weightTextfieldView.layer.cornerRadius = 16
        weightTextfieldView.layer.borderWidth = 1.5
        weightTextfieldView.layer.borderColor = UIColor.black.cgColor

        weightTextField.borderStyle = .none
        weightTextField.keyboardType = .decimalPad

    }
    
    private func setCheckResultButtonDesign() {
        checkResultButton.setTitle("결과 확인", for: .normal)
        checkResultButton.layer.cornerRadius = 16
        checkResultButton.backgroundColor = .accent
        checkResultButton.tintColor = .white
    }
}

// MARK: - IBActions
extension ViewController {
    @IBAction func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func calcRandomBMIButtonTapped() {
        let randomHeight = Float.random(in: 100...200)
        let randomWeight = Float.random(in: 10...150)
        
        heightTextField.text = String(randomHeight)
        weightTextField.text = String(randomWeight)
        
        let randomBMI = calcBMI(
            height: randomHeight,
            weight: randomWeight
        )
        
        refreshResultLabel(to: String(randomBMI))
    }
    
    @IBAction func calcBMIButtonTapped() {
        if validateText() {
            let bmi = calcBMI(
                height: Float(heightTextField.text!)!,
                weight: Float(weightTextField.text!)!
            )
            refreshResultLabel(to: String(bmi))
        } else {
            refreshResultLabel(to: "")
        }
    }
}

// MARK: - Logics
extension ViewController {
    private func refreshResultLabel(to text: String) {
        resultLabel.text = text
    }
    
    private func calcBMI(height: Float, weight: Float) -> Float {
        let heightInMeter = height / 100
        
        let bmi = weight / (heightInMeter * heightInMeter)
        let bmiRound = (bmi * 10).rounded() / 10
        
        return bmiRound
    }
    
    private func setErrorText(to text: String) {
        errorLabel.text = text
    }
    
    private func validateText() -> Bool {
        
        var errorText: String = ""
        
        // 공백 확인
        guard !checkTextEmpty(heightTextField.text), !checkTextEmpty(weightTextField.text) else {
            if checkTextEmpty(heightTextField.text) {
                errorText += BMIErrorType.heightTextEmpty.rawValue + "\n"
            }
            
            if checkTextEmpty(weightTextField.text) {
                errorText += BMIErrorType.weightTextEmpty.rawValue + "\n"
            }
            
            setErrorText(to: errorText)
            return false
        }
        
        // 숫자 확인
        guard let height = Float(heightTextField.text!),
           let weight = Float(weightTextField.text!) else {
            
            if Float(heightTextField.text!) == nil {
                errorText += BMIErrorType.heightTextNotNumber.rawValue + "\n"
            }
            
            if Float(weightTextField.text!) == nil {
                errorText += BMIErrorType.weightTextNotNumber.rawValue + "\n"
            }
            
            setErrorText(to: errorText)
            return false
        }
        
        // 범위 확인
        guard height > 0, height <= 400,
           weight > 0, weight <= 400 else {
            if !(height > 0 && height <= 400) {
                errorText += BMIErrorType.heightOutOfRange.rawValue + "\n"
            }
            
            if !(weight > 0 && weight <= 400) {
                errorText += BMIErrorType.weightOutOfRange.rawValue + "\n"
            }
            
            setErrorText(to: errorText)
            return false
        }
        
        setErrorText(to: "")
        return true
    }
    
    private func checkTextEmpty(_ text: String?) -> Bool {
        return text!.trimmingCharacters(in: [" "]).isEmpty
    }
}

enum BMIErrorType: String {
    case heightTextEmpty = "키 입력이 안됐어요"
    case weightTextEmpty = "몸무게 입력이 안됐어요"
    case heightTextNotNumber = "키가 숫자가 아니에요"
    case weightTextNotNumber = "몸무게가 숫자가 아니에요"
    case heightOutOfRange = "사람의 키가 되기 힘든 숫자입니다"
    case weightOutOfRange = "사람의 몸무게가 되기 힘든 값입니다"
}
