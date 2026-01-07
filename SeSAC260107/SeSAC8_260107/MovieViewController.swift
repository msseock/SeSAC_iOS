//
//  MovieViewController.swift
//  SeSAC8_260107
//
//  Created by 석민솔 on 1/7/26.
//

import UIKit

class MovieViewController: UIViewController {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var actorLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var recommendButton: UIButton!
    
    var list = [
        "세계의 주인", "프란시스 하", "존 오브 인터레스트", "애프터 양", "사울의 아들"
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
                        
        setDateLabel()
        setTitleLabel()
        setButtonDesign()

    }
        
    /// 영화 추가
    @IBAction func textFieldReturnTapped(_ sender: UITextField) {
        if let text = userTextField.text, !text.trimmingCharacters(in: [" "]).isEmpty {
            list.append(text)
            userTextField.text?.removeAll()
            print(list)
        } else {
            print("뭐가 없음")
        }
    }
    
    /// 영화 랜덤 추천
    @IBAction func recommendButtonTapped(_ sender: UIButton) {
        titleLabel.text =  getRandomMovie()
    }
    
}

// MARK: - UI 그리기
extension MovieViewController {
    func setDateLabel() {
        dateLabel.text = getToday()
        dateLabel.font = .systemFont(ofSize: 25, weight: .regular)
        dateLabel.numberOfLines = 1
    }
    
    func setTitleLabel() {
        titleLabel.text = getRandomMovie()
    }
    
    func setButtonDesign() {
        recommendButton.setTitle("영화 랜덤 추천", for: .normal)
    }

}


// MARK: - Logic Methods
extension MovieViewController {
    
    /// 오늘 날짜 조회하기
    func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy-MM-dd"
        let result = format.string(from: Date())
        
        return result
    }
    
    func getRandomMovie() -> String {
        let random = list.randomElement()
        return random ?? "괴물"
    }

}
