//
//  MyImageViewController.swift
//  SeSAC260102
//
//  Created by 석민솔 on 1/5/26.
//

import UIKit

class MyImageViewController: UIViewController {

    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    
    @IBOutlet var posterImageView: UIImageView!
    
    @IBOutlet var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        // oneButton
        setOneButtonDesign()
        
        // twoButton
        setTwoButtonDesign()
        
        // posterImageView
        setImageViewDesign()
        
        // nicknameTextField
        setTextFieldDesign()
        
    }
    
    func setOneButtonDesign() {
        oneButton.setTitle("오늘의 영화 추천", for: .normal)
        oneButton.setTitle("Mad Max😎", for: .highlighted)
        
        oneButton.setTitleColor(.systemBlue, for: .normal)
        oneButton.setTitleColor(.systemYellow, for: .highlighted)
        
        oneButton.setImage(UIImage(systemName: "pencil"), for: .normal)
    }
    
    func setTwoButtonDesign() {
        twoButton.setTitle("dismiss Keyboard", for: .normal)
    }
    
    func setImageViewDesign() {
        posterImageView.backgroundColor = .systemYellow
        posterImageView.layer.cornerRadius = 20
        posterImageView.clipsToBounds = true
        posterImageView.tintColor = .black
        
        posterImageView.image = UIImage(named: "콘크리트유토피아")
        posterImageView.contentMode = .scaleAspectFill

    }
    
    func setTextFieldDesign() {
        nicknameTextField.placeholder = "닉네임을 입력해주세요"
        nicknameTextField.borderStyle = .none
        nicknameTextField.keyboardType = .emailAddress
        nicknameTextField.isSecureTextEntry = true
    }
    
    @IBAction func twoButtonClicked(_ sender: UIButton) {
        // 키보드 내리기
        view.endEditing(true)
    }
    
    
    @IBAction func tapClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func nicknameTextFieldEditingChanged(_ sender: UITextField) {
        if let text = nicknameTextField.text {
            print(">>>", text, text.count)
        }
    }
    
    @IBAction func nicknameTextFieldEditingDidEnd(_ sender: UITextField) {
        print("텍스트필드 EditingDidEnd")
    }
    
    @IBAction func nicknameTextFieldDidEndOnExit(_ sender: UITextField) {
        print("텍스트필드 DidEndOnExit")
    }
}
