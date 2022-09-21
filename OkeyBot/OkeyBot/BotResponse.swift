//
//  BotResponse.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/21.
//

import Foundation
 
func getBotResponse(message: String) -> String {
    
    // 모든 메시지 소문자로 변환
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("안녕") {
        return "안녕하세요!"
    } else if tempMessage.contains("잘가") {
        return "나중에 또 봐요!"
    } else if tempMessage.contains("오늘 어때?") {
        return "좋아요. 당신은요?"
    } else {
        return "멋져요"
    }
}
