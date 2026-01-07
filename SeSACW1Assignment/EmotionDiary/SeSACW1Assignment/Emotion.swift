//
//  Emotion.swift
//  SeSACW1Assignment
//
//  Created by 석민솔 on 1/5/26.
//


enum Emotion: Int {
    case cold
    case drooling
    case exploding
    case kissing
    case melting
    case partying
    case sleepy
    case sunglasses
    case tears
    case none
}

extension Emotion {
    var imageName: String {
        switch self {
        case .cold:
            "cold"
        case .drooling:
            "drooling"
        case .exploding:
            "exploding"
        case .kissing:
            "kissing"
        case .melting:
            "melting"
        case .partying:
            "partying"
        case .sleepy:
            "sleepy"
        case .sunglasses:
            "sunglasses"
        case .tears:
            "tears"
        case .none:
            "nosign"
        }
    }
    
    var text: String {
        switch self {
        case .cold:
            "추워"
        case .drooling:
            "맛있어"
        case .exploding:
            "머리터져"
        case .kissing:
            "히히"
        case .melting:
            "죽겠다"
        case .partying:
            "신나"
        case .sleepy:
            "졸려"
        case .sunglasses:
            "멋져"
        case .tears:
            "삥삥"
        case .none:
            "error"
        }
    }
}
