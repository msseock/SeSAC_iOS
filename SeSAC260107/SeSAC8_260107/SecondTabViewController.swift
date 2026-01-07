//
//  SecondTabViewController.swift
//  SeSAC8_260107
//
//  Created by Jack on 1/7/26.
//

import UIKit

class SecondTabViewController: UIViewController {
    
    let colors: [UIColor] = [
        .systemYellow, .systemCyan, .systemGray, .systemTeal
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
    }
    
    // A -> B 상태에서, B -> A로 돌아오고 싶을 때,
    // B에서 버튼을 눌러서 A 화면으로 돌아온다고 하더라도,
    // A 화면에 코드를 작성!!
    // 주의: 스토리보드에서 끌어서 IBAction을 연결하는 게 아님
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue) {
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self, #function)
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self, #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self, #function)
    }


}
