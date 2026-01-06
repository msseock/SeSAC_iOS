//
//  MainViewController.swift
//  JackflixTabs
//
//  Created by 석민솔 on 1/5/26.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var largePosterImageView: UIImageView!
    
    @IBOutlet var headlineLabel: UILabel!
    
    @IBOutlet var smallFirstImageView: UIImageView!
    @IBOutlet var smallSecondImageView: UIImageView!
    @IBOutlet var smallThirdImageView: UIImageView!
    
    private let largeCornerRadius: CGFloat = 12
    private let smallCornerRadius: CGFloat = 8

    private let largeBorderWidth: CGFloat = 3
    private let smallBorderWidth: CGFloat = 1.5
    
    let posterImages: [String] = [
        "노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        largePosterImageView.layer.cornerRadius = largeCornerRadius
        largePosterImageView.clipsToBounds = true
        largePosterImageView.layer.borderColor = UIColor.white.cgColor
        largePosterImageView.layer.borderWidth = largeBorderWidth
        
        smallFirstImageView.layer.cornerRadius = smallCornerRadius
        smallFirstImageView.clipsToBounds = true
        smallFirstImageView.layer.borderColor = UIColor.white.cgColor
        smallFirstImageView.layer.borderWidth = smallBorderWidth

        smallSecondImageView.layer.cornerRadius = smallCornerRadius
        smallSecondImageView.clipsToBounds = true
        smallSecondImageView.layer.borderColor = UIColor.white.cgColor
        smallSecondImageView.layer.borderWidth = smallBorderWidth

        smallThirdImageView.layer.cornerRadius = smallCornerRadius
        smallThirdImageView.clipsToBounds = true
        smallThirdImageView.layer.borderColor = UIColor.white.cgColor
        smallThirdImageView.layer.borderWidth = smallBorderWidth

        
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        print("playbutton Tapped")
        // 이미지뷰 포스터 랜덤
        let randomPosterIndexes: [Int] = {
            var tempArray: [Int] = []
            for _ in 1...4 {
                tempArray.append(Int.random(in: 0..<posterImages.count))
            }
            return tempArray
        }()
        
        largePosterImageView.image = UIImage(named: posterImages[randomPosterIndexes[0]])
        smallFirstImageView.image = UIImage(named: posterImages[randomPosterIndexes[1]])
        smallSecondImageView.image = UIImage(named: posterImages[randomPosterIndexes[2]])
        smallThirdImageView.image = UIImage(named: posterImages[randomPosterIndexes[3]])
        
        // headline isHidden 랜덤
        headlineLabel.isHidden = Bool.random()
    }
    

}
