//
//  ViewController.swift
//  SeSAC7Week1Remind
//
//  Created by Jack on 7/3/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func zodiacSignsTapped(_ sender: UIButton) {
        getZodiacSign(month: Int.random(in: 1...12))
    }
    
    func getZodiacSign(month: Int) {
        
        //여기에 코드를 작성해주세요
        //3월이면 양자리, 4월이면 황소자리 등
        var zodiacSign: String = ""
        
        switch month {
        case 1:
            zodiacSign = "물병"
        case 2:
            zodiacSign = "물고기"
        case 3:
            zodiacSign = "양"
        case 4:
            zodiacSign = "황소"
        case 5:
            zodiacSign = "쌍둥이"
        case 6:
            zodiacSign = "게"
        case 7:
            zodiacSign = "사자"
        case 8:
            zodiacSign = "처녀"
        case 9:
            zodiacSign = "천칭"
        case 10:
            zodiacSign = "전갈"
        case 11:
            zodiacSign = "사수"
        case 12:
            zodiacSign = "염소"
        default:
            zodiacSign = "이상한"
        }
        
        resultLabel.text = "\(month)월은 \(zodiacSign)자리입니다."
    }
    
    @IBAction func recommandGameJob(_ sender: UIButton) {
        let strength = Int.random(in: 1...100)
        let agility = Int.random(in: 1...100)
        getRecommandGameJob(strength: strength, agility: agility)
    }
    
    func getRecommandGameJob(strength: Int, agility: Int) {
        //여기에 코드를 작성해주세요
        //힘(strength)이 높으면 전사, 민첩(agility)이 높으면 도적, 같다면 마법사 추천
        let strongestPosition: String
        let recommendation: String

        if strength > agility {
            strongestPosition = "strength(힘)이 가장 높으니"
            recommendation = "전사"
        } else if strength < agility {
            strongestPosition = "민첩(agility)이 가장 높으니"
            recommendation = "도적"
        } else {
            strongestPosition = "힘과 민첩 지수가 같아서"
            recommendation = "마법사"
        }
        
        resultLabel.text = "\(strongestPosition) \(recommendation)를 추천드립니다."
    }
    
    @IBAction func recommandClothing(_ sender: UIButton) {
        let temp = Int.random(in: -30...50)
        let rain = Bool.random()
        
        getRecommandClothing(temperature: temp, isRaining: rain)
    }
    
    func getRecommandClothing(temperature: Int, isRaining: Bool) {
        
        //여기에 코드를 작성해주세요
        //영하~10도라면 페딩을 입으세요, 10도~20도 긴팔을 입으세요, 20~30도 반팔을 입으세요, 30도 이상 나가지마세요
        //비가 온다면 우산을 챙기세요
        let cloth: String
        let umbrella: String
        
        // temp
        if temperature < 10 {
            cloth = "페딩을 입으세요"
        } else if 10 <= temperature && temperature < 20 {
            cloth = "긴팔을 입으세요"
        } else if 20 <= temperature && temperature < 30 {
            cloth = "반팔을 입으세요"
        } else {
            cloth = "나가지 마세요"
        }
        
        // rain
        umbrella = isRaining ? "비가 오니 우산을 챙기세요" : "비가 오지 않으니 우산은 안챙겨도 됩니다"
        
        resultLabel.text = """
                            지금 온도가 \(temperature)도 이니 \(cloth). 
                            \(umbrella).  
                            """
    }
    
    @IBAction func evaluateGrade(_ sender: UIButton) {
        let data: [Int] = [3, 27, 64, 89, 7, 12, 45, 78, 14, 29, 56, 92, 1, 33, 67, 85, 9, 21, 48, 76, 18, 41, 63, 94, 5, 30, 52, 87, 11, 26, 59, 81, 15, 37, 70, 96, 2, 34, 61, 83, 8, 23, 49, 90, 17, 39, 65, 98, 4, 28, 53, 79, 12, 36, 68, 91, 6, 31, 57, 84, 19, 42, 66, 95, 10, 25, 51, 88, 16, 38, 60, 97, 13, 32, 55, 82, 20, 44, 69, 93, 3, 29, 62, 86, 7, 35, 58, 80, 14, 40, 64, 99, 1, 24, 50, 77, 9, 33, 67, 92, 18, 46, 71, 85, 5, 27, 54, 89, 11, 39, 63, 96, 15, 34, 59, 81, 2, 30, 65, 94, 8, 41, 68, 87, 17, 37, 52, 90, 4, 26, 61, 83, 12, 43, 70, 98, 6, 28, 56, 79, 19, 45, 66, 91, 10, 32, 58, 84, 16, 40, 62, 95, 13, 25, 51, 88, 20, 38, 69, 97, 3, 31, 57, 82, 7, 36, 64, 93, 14, 29, 50, 86, 1, 42, 67, 80, 9, 34, 61, 99, 18, 27, 55, 92, 5, 39, 68, 85, 11, 33, 60, 94, 15, 46, 71]
        
        //여기에 코드를 작성해주세요
        let average: Int = data.reduce(0, +) / data.count
        
        resultLabel.text = "\(data.count)명의 평균 점수는 \(String(average))점입니다."
    }
    
    @IBAction func countFruits(_ sender: UIButton) {
        let fruits = ["체리", "딸기", "사과", "멜론", "망고", "오렌지", "오렌지", "키위", "딸기", "사과", "복숭아", "포도", "배", "바나나", "오렌지", "배", "포도", "참외", "사과", "블루베리", "오렌지", "오렌지", "바나나", "사과", "수박", "포도", "딸기", "체리", "사과", "자두", "멜론", "멜론", "수박", "파인애플", "참외", "참외", "바나나", "멜론", "사과", "사과", "자두", "딸기", "바나나", "석류", "라임", "키위", "자두", "사과", "오렌지", "자두", "레몬", "바나나", "사과", "수박", "체리", "사과", "블루베리", "딸기", "바나나", "수박", "체리", "사과", "복숭아", "수박", "참외", "오렌지", "바나나", "참외", "오렌지", "바나나", "체리", "딸기", "바나나", "감", "감", "키위", "자두", "포도", "파인애플", "포도", "사과", "포도", "블루베리", "포도", "바나나", "사과", "망고", "복숭아", "레몬", "사과", "자두", "복숭아", "포도", "오렌지", "오렌지", "수박", "망고", "사과", "블루베리", "감", "바나나", "딸기", "바나나"]
        
        //여기에 코드를 작성해주세요
        
        // 종류별 갯수 세기
        var fruitList: [String] = []
        var countList: [Int] = []
        var totalCount: Int = 0
        
        for fruit in fruits {
            if fruitList.contains(fruit) {
                if let index = fruitList.firstIndex(of: fruit) {
                    countList[index] += 1
                }
            } else {
                fruitList.append(fruit)
                countList.append(0)
                if let index = fruitList.firstIndex(of: fruit) {
                    countList[index] += 1
                }
            }
            totalCount += 1
        }
        
        // return text만들기
        var returnText: String = ""
        totalCount = 0
        
        for fruit in fruitList {
            returnText += "\(fruit): \(countList[totalCount])개"
            totalCount += 1
            if totalCount != fruitList.count {
                returnText += ", "
            }
        }
        
        resultLabel.text = returnText
    }
     
    
}

