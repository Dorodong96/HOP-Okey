//
//  KeyBoardView.swift
//  OkeyBot
//
//  Created by 종건 on 2022/09/29.
//

import SwiftUI

struct KeyBoardView: View {
    @ObservedObject var messageViewModel: MessageViewModel
    var body: some View {
        HStack {
            TextField("옥희에게 말해주세요.", text: $messageViewModel.messageText)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .onSubmit {
                    sendMessage(message: messageViewModel.messageText)
                }
            Button {
                sendMessage(message:  messageViewModel.messageText)
               // messageViewModel.messages.append(survey.question[messageViewModel.index])
              //  messageViewModel.increaseIndex()
            } label: {
                messageViewModel.isPossiblebutton ? Image(systemName: "paperplane.fill").foregroundColor(Color.gray) : Image(systemName: "paperplane.fill").foregroundColor(Color.red)
            }
            .disabled(messageViewModel.isPossiblebutton)
            .font(.system(size: 32))
            .padding(.horizontal, 10)
        }.onAppear(){
            messageViewModel.test = false
           // withAnimation{
                messageViewModel.test.toggle()
            //}
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messageViewModel.messages.append("[USER]" + message)
            messageViewModel.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messageViewModel.messages.append(getBotResponse(message: message))
            }
        }
    }
}


