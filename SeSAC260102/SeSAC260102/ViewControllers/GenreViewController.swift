//
//  GenreViewController.swift
//  SeSAC260102
//
//  Created by 석민솔 on 1/5/26.
//

import UIKit

class GenreViewController: UIViewController {

    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    
    @IBOutlet var centerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        
        // oneButton
        setButtonDesign(
            for: oneButton,
            title: "Drama",
            backgroundColor: .white,
            titleColor: .black,
            titleHighlightedColor: .systemYellow
        )
        
        // twoButton
        setButtonDesign(
            for: twoButton,
            title: "SF",
            backgroundColor: .black,
            titleColor: .white,
            titleHighlightedColor: .systemBlue
        )

        // threeButton
        setButtonDesign(
            for: threeButton,
            title: "Thriller",
            backgroundColor: .systemBrown,
            titleColor: .white,
            titleHighlightedColor: .systemRed
        )

        // fourButton
        setButtonDesign(
            for: fourButton,
            title: "Action",
            backgroundColor: .systemBlue,
            titleColor: .white,
            titleHighlightedColor: .systemCyan
        )
        
        buttonTapped(twoButton)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setButtonDesign(
        for button: UIButton,
        title: String,
        backgroundColor: UIColor,
        titleColor: UIColor,
        titleHighlightedColor: UIColor
    ) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleHighlightedColor, for: .highlighted)
    }
    
    /*
     과거 노가다의 흔적
     
    @IBAction func oneButtonTapped(_ sender: UIButton) {
        print("oneButtonTapped")
        centerLabel.text = "Drama"
    }
    
    @IBAction func twoButtonTapped(_ sender: UIButton) {
        print("twoButtonTapped")
        centerLabel.text = "SF"
    }
    
    @IBAction func threeButtonTapped(_ sender: UIButton) {
        print("threeButtonTapped")
        centerLabel.text = "Thriller"
    }
    
    @IBAction func fourButtonTapped(_ sender: UIButton) {
        print("fourButtonTapped")
        centerLabel.text = sender.currentTitle
    }
     
     */
    
    // 마음편안
    @IBAction func buttonTapped(_ sender: UIButton) {
        centerLabel.text = sender.currentTitle
    }
}
