//
//  TextFieldType.swift
//  JackflixSignUp
//
//  Created by 석민솔 on 1/5/26.
//


enum TextFieldType {
    case email
    case password
    case nickname
    case location
    case recommender
    case none
}

extension TextFieldType {
    var text: String {
        switch self {
        case .email:
            "이메일 주소 또는 전화번호"
        case .password:
            "비밀번호"
        case .nickname:
            "닉네임"
        case .location:
            "위치"
        case .recommender:
            "추천 코드 입력"
        case .none:
            "error"
        }
    }
}