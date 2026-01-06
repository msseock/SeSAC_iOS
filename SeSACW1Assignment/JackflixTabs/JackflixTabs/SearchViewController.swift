//
//  SearchViewController.swift
//  JackflixTabs
//
//  Created by 석민솔 on 1/5/26.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet var soonButton: UIButton!
    @IBOutlet var hotButton: UIButton!
    @IBOutlet var top10Button: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    
    private var selectedButtonIndex: Int = 0
    private var buttonTextList: [String] = [
        "공개 예정", "모두의 인기 콘텐츠", "TOP 10 시리즈"
    ]
    private var imageForButtonNames: [String] = [
        "blue", "turquoise", "pink"
    ]
    
    // MARK: - UI
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonDesign(for: soonButton, isFirstSet: true)
        setButtonDesign(for: hotButton, isFirstSet: true)
        setButtonDesign(for: top10Button, isFirstSet: true)

        resultLabel.text = buttonTextList[selectedButtonIndex]
    }
    
    /// 버튼 디자인 설정
    private func setButtonDesign(
        for button: UIButton,
        isFirstSet: Bool = false
    ) {
        let buttonIndex = getButtonIndex(of: button)
        
        if isFirstSet {
            button.setTitle(buttonTextList[buttonIndex], for: .normal)
            button.setImage(UIImage(named: imageForButtonNames[buttonIndex]), for: .normal)

        }
        
        let isSelected = buttonIndex == selectedButtonIndex

        button.setTitleColor(isSelected ? .black : .white, for: .normal)
        button.backgroundColor = isSelected ? .white : .black
    }
    
    // 선택여부에 따라
    private func setSelectedButtonDesign(for button: UIButton, isSelected: Bool) {
        button.setTitleColor(isSelected ? .black : .white, for: .normal)
        button.backgroundColor = isSelected ? .white : .black
    }
        
    private func refreshAllButton() {
        setButtonDesign(for: soonButton)
        setButtonDesign(for: hotButton)
        setButtonDesign(for: top10Button)
    }
    
        
    private func getButtonIndex(of button: UIButton) -> Int {
        switch button {
        case soonButton: 0
        case hotButton: 1
        case top10Button: 2
        default: -1
        }
    }
    
    // MARK: - Logic
    @IBAction func headlineButtonTapped(_ sender: UIButton) {
        self.selectedButtonIndex = getButtonIndex(of: sender)
        
        refreshAllButton()
        
        resultLabel.text = sender.titleLabel?.text
    }

}
