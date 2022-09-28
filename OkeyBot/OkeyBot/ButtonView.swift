//
//  ButtonView.swift
//  OkeyBot
//
//  Created by 종건 on 2022/09/28.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var messageViewModel: MessageViewModel
    let survey: Survey = Survey()
    var body: some View {
        VStack{
            if(messageViewModel.test){
            HStack{
                Button(action: {
                    messageViewModel.increaseIndex()
                    sendMessage(message: "[USER]예", index: messageViewModel.index)
                }) {
                    HStack {
                        Text("예")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                }
                Button(action: {
                    messageViewModel.increaseIndex()
                    sendMessage(message: "[USER]아니요", index: messageViewModel.index)
                }) {
                    HStack {
                        Text("아니요")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                }
            }
        }
        }.onAppear(){
            messageViewModel.test = false
           // withAnimation{
                messageViewModel.test.toggle()
            //}
            
        }
    }
    func sendMessage(message: String, index: Int) {
        withAnimation {
            messageViewModel.messages.append("[USER]" + message)
            messageViewModel.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messageViewModel.messages.append(survey.question[index])
            }
        }
    }

}
