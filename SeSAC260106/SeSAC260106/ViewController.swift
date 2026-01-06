//
//  ViewController.swift
//  SeSAC260106
//
//  Created by 석민솔 on 1/6/26.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: Outlet
    // searchbar
    @IBOutlet var searchBarView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!

    @IBOutlet var slangStackViews: [UIStackView]!
    
    @IBOutlet var slangButtonList: [UIButton]!
    
    @IBOutlet var slangResultBackgroundImageView: UIImageView!
    @IBOutlet var slangResultLabel: UILabel!
    
    
    let slangData: [(slang: String, meaning: String)] = [
        ("감다살", "감이 다 살아났다"),
        ("감다뒤", "감이 다 뒤졌다"),
        ("싹싹김치", "좋다, 잘됐다 등의 감탄사"),
        ("랜선생님", "비대면으로 큰 가리침을 주는 사람"),
        ("랜선생님", "비대면으로 큰 가르침을 주는 사람"),
        ("랜선생님", "비대면으로 큰 가르침을 주는 사람"),
        ("랜선생님", "비대면으로 큰 가르침을 주는 사람"),
        ("테무인간", "일은 열심히 하는데 퀄리티는 별로인 사람"),
        ("밥플릭스", "밥 먹으면서 보는 영상"),
        ("고민세", "망설이다가 내는 돈"),
        ("느좋", "'느낌 좋다'의 줄임말"),
        ("느좋", "'느낌 좋다'의 줄임말"),
        ("느좋", "'느낌 좋다'의 줄임말")
    ]
    
    // 중복제거된 slangData
    var slangDataRemoveDuplicates: [(slang: String, meaning: String)] {
        
        var finalArray: [(slang: String, meaning: String)] = []
        
        for slang in slangData {
            if !finalArray.contains(where: { $0.slang == slang.slang }) {
                finalArray.append(slang)
            }
        }
        
        return finalArray
    }
    
    // MARK: - UI
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setSearchBarDesign()
        setSlangButtonDesign()
        setResultDesign()
    }
    
    /// 검색바 UI 설정
    private func setSearchBarDesign() {
        searchBarView.backgroundColor = .black
        
        searchTextField.backgroundColor = .white
        searchTextField.textColor = .black
        searchTextField.borderStyle = .none
        
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.setTitle("", for: .normal)
    }
    
    /// 신조어 버튼 전체 설정
    private func setSlangButtonDesign() {
        // 버튼 스택 설정
        for stackView in slangStackViews {
            stackView.distribution = .fillProportionally
        }
        
        // 버튼 개별 스타일 설정
        for slangButton in slangButtonList {
            let buttonIndex = slangButtonList.firstIndex(of: slangButton)!
            
            slangButton.setTitle(slangDataRemoveDuplicates[buttonIndex].slang, for: .normal)
            
            slangButton.layer.cornerRadius = 8
            slangButton.clipsToBounds = true
            slangButton.layer.borderColor = UIColor.black.cgColor
            slangButton.layer.borderWidth = 2
            slangButton.tintColor = .black
        }
    }
    
    /// 중앙부 결과 부분 UI 초기 설정
    private func setResultDesign() {
        slangResultBackgroundImageView.image = UIImage(named: "background")
        slangResultBackgroundImageView.contentMode = .scaleAspectFill
        
        slangResultLabel.text = ""
        slangResultLabel.textAlignment = .center
        slangResultLabel.numberOfLines = 3
    }

    // MARK: - Action
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        search(for: searchTextField.text)
    }
    
    @IBAction func slangButtonTapped(_ sender: UIButton) {
        search(for: sender.titleLabel?.text)
    }
    
    /// return키 눌렸을때
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        search(for: sender.text)
    }
    
    /// 화면터치
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    // MARK: - Methods
    /// slangDataRemoveDuplicates안에서 meaning있는지 검색
    private func search(_ slang: String) -> String? {
        let meaning = slangDataRemoveDuplicates.first { $0.slang == slang }?.meaning
        
        return meaning
    }
    
    /// 검색하고 화면전환까지
    private func search(for slang: String?) {
        // 공백일경우 검색실행 안하기
        guard let slang, !slang.isEmpty else {
            return
        }
                
        // 검색 실행
        let result = search(slang)
        refreshResultDesign(to: result)
    }
    
    /// 누를 때마다 신조어 해설 라벨 글자 바뀌도록
    private func refreshResultDesign(to text: String?) {
        if let text = text {
            slangResultLabel.text = text
        } else {
            slangResultLabel.text = "검색 결과가 없습니다"
        }
    }

}

