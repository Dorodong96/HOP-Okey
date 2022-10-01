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
        "평소 자신의 생활에 만족하시나요?",
        "매일 가족들과 대화하시나요?",
        "가끔 낙담하고 우울하다고 느끼세요?",
        "자유로운 대화를 원하시나요?",
        "힘드신 일을 말씀해주세요" ,
        "항상 응원합니다",
        "감사합니다"
    ]
    let positveAnswer: [String] = [
    "좋아요","그럼요","네","네","부탁해","",
    ]
    let negativeAnswer: [String] = [
        "나중에","아니요","아니요","아니요","싫어","",
    ]
    
    
}
