//
//  SignUpViewController.swift
//  JackflixSignUp
//
//  Created by 석민솔 on 1/5/26.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var logoLabel: UILabel!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommenderTextField: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var moreInfoSwitch: UISwitch!
    var isSwitchOn: Bool = false
    
    private let generalCornerRadius: CGFloat = 4
    
    // MARK: UI
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLogoDesign()
        setAllTextFieldDesign()
        setSignUpButtonDesign()
        setSwitchDesign()
    }
    
    /// JACKFLIX 로고 UI
    private func setLogoDesign() {
        logoLabel.text = "JACKFLIX"
        logoLabel.textColor = .systemRed
        logoLabel.font = .systemFont(ofSize: 25, weight: .black)
    }

    /// 모든 텍스트필드 UI
    private func setAllTextFieldDesign() {
        setTextFieldDesign(for: emailTextField)
        setTextFieldDesign(for: passwordTextField)
        setTextFieldDesign(for: nicknameTextField)
        setTextFieldDesign(for: locationTextField)
        setTextFieldDesign(for: recommenderTextField)
    }
    
    /// 단일 텍스트필드 UI
    private func setTextFieldDesign(for textField: UITextField) {
        // textfield Type 설정
        let textfieldType: TextFieldType = {
            switch textField {
            case emailTextField: .email
            case passwordTextField: .password
            case nicknameTextField: .nickname
            case locationTextField: .location
            case recommenderTextField: .recommender
            default: .none
            }
        }()
        
        textField.attributedPlaceholder = .init(string: textfieldType.text, attributes: [.foregroundColor : UIColor.placeholderlabel])
        textField.backgroundColor = UIColor.placeholderbcg
        textField.textColor = .white
        textField.layer.cornerRadius = generalCornerRadius
        textField.clipsToBounds = true
        textField.textAlignment = .center
        
        if textfieldType == .email {
            textField.keyboardType = .emailAddress
        } else if textfieldType == .password {
            textField.isSecureTextEntry = true
        }
    }
    
    /// 회원가입 버튼 UI
    private func setSignUpButtonDesign() {
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = generalCornerRadius
        signUpButton.clipsToBounds = true
        signUpButton.titleLabel?.textAlignment = .center
    }
    
    /// switch UI
    private func setSwitchDesign() {
        moreInfoSwitch.setOn(isSwitchOn, animated: true)
        moreInfoSwitch.onTintColor = .systemRed
        moreInfoSwitch.thumbTintColor = .systemTeal
    }

    
    // MARK: - Logic
    /// 키보드 내리기
    @IBAction func nicknameTextFieldDidEndOnExit(_ sender: UITextField) {
        print("텍스트필드 DidEndOnExit")
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let totalInfoText =
            """
            email: \(getDescribingString(of: emailTextField.text))
            비밀번호: \(getDescribingString(of: passwordTextField.text))
            닉네임: \(getDescribingString(of: nicknameTextField.text)) 
            위치: \(getDescribingString(of: locationTextField.text))
            추천인: \(getDescribingString(of: recommenderTextField.text))
            """
        print(totalInfoText)
    }
    
    private func getDescribingString(of text: String?) -> String {
        let resultText: String
        if let text = text, !text.isEmpty {
            resultText = String(describing: text)
        } else {
            resultText = "-"
        }
        return resultText
    }
}


