//
//  FirstTabViewController.swift
//  SeSAC8_260107
//
//  Created by Jack on 1/7/26.
//

import UIKit

class FirstTabViewController: UIViewController {
    
    let nickname: String = "잼있는미니딸기쿠키"
    
    let colors: [UIColor] = [
        .systemRed, .systemOrange, .systemBlue, .systemBrown
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        let nickname = "칙촉"
        print(self, #function, nickname, self.nickname)
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
