//
//  Survey.swift
//  OkeyBot
//
//  Created by 종건 on 2022/09/28.
//

import Foundation
struct Survey{
    let question: [String] = [
        "간단한 질문을 몇 개 드려도 될까요?",
        "본인이 아플 때 돌봐줄 가족이 있다고 생각하시나요?",
        "매일 가족들과 대화하시나요?",
        "자유로운 대화를 원하시나요?",
        "힘드신 일을 말씀해주세요" ,
        "항상 응원합니다",
        "감사합니다"
    ]
    let positveAnswer: [String] = [
    "그럼요","예","좋아요","부탁해","",
    ]
    let negativeAnswer: [String] = [
        "아니요","아니요","아니요","싫어","",
    ]
    
    
}
