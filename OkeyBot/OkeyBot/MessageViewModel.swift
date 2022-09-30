//
//  MessageViewModel.swift
//  OkeyBot
//
//  Created by 종건 on 2022/09/28.
//

import Foundation

class MessageViewModel: ObservableObject{
    
    @Published var index: Int = 0
    @Published var messages: [String] = ["옥희봇에 오신걸 환영합니다.", "간단한 질문을 몇 개 드려도 될까요?",]
    @Published var isPossiblebutton: Bool = true
    @Published var test: Bool = true
    @Published var messageText: String = ""
    @Published var isPossibleShowButton: Bool = true
    
    func increaseIndex(){
        index += 1
        print("Debug index",index)
        checkButtonisPossible()
    }
    func checkButtonisPossible(){
        if index == 4 {
            isPossiblebutton = false
        }
    }
}
