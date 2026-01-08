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
    
    typealias MovieSet = (movieName: String, runtime: Int, actor: String)
    
    var list: [MovieSet] = [
        ("세계의 주인", 123, "서수빈"),
        ("프란시스 하", 100, "그레타 거윅"),
        ("존 오브 인터레스트", 150, "산드라 휠러"),
        ("애프터 양", 90, "저스틴 민"),
        ("사울의 아들", 106, "게자 뢰리히"),
    ]
    
    var movieList: [MovieData] = [
        .init(title: "세계의 주인", runtime: 123, actor: "서수빈"),
        .init(title: "프란시스 하", runtime: 100, actor: "그레타 거윅"),
        .init(title: "존 오브 인터레스트", runtime: 150, actor: "산드라 휠러"),
        .init(title: "애프터 양", runtime: 90, actor: "저스틴 민"),
        .init(title: "사울의 아들", runtime: 106, actor: "게자 뢰리히")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
                        
        setDateLabel()
        setMovieInfoLabels()
        setButtonDesign()

    }
        
    /// 영화 추가
    @IBAction func textFieldReturnTapped(_ sender: UITextField) {
        if let text = userTextField.text, !text.trimmingCharacters(in: [" "]).isEmpty {
            movieList.append(.init(title: text, runtime: 0, actor: "actor"))
            userTextField.text?.removeAll()
            print(movieList)
        } else {
            print("뭐가 없음")
        }
    }
    
    /// 영화 랜덤 추천
    @IBAction func recommendButtonTapped(_ sender: UIButton) {
        setMovieInfoLabels()
    }
    
}

// MARK: - UI 그리기
extension MovieViewController {
    func setDateLabel() {
        dateLabel.text = getToday()
        dateLabel.font = .systemFont(ofSize: 25, weight: .regular)
        dateLabel.numberOfLines = 1
    }
    
    func setMovieInfoLabels() {
        let randomMovieSet = getRandomMovie()
        
        titleLabel.text =  randomMovieSet.title
        actorLabel.text = randomMovieSet.actor
        runtimeLabel.text = String(randomMovieSet.runtime)
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
    
    func getRandomMovie() -> MovieData {
        let randomElement = movieList.randomElement()!
        
        return randomElement
    }

}


struct MovieData {
    let title: String
    let runtime: Int
    let actor: String
}
