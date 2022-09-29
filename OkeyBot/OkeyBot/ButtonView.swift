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
                    messageViewModel.isPossibleShowButton = false
                }) {
                    HStack {
                        Text("예")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("LGreen"))
                            .font(.title)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20).stroke(Color("LGreen"), lineWidth: 3.5)
                    )
                }
                Button(action: {
                    messageViewModel.increaseIndex()
                    sendMessage(message: "[USER]아니요", index: messageViewModel.index)
                    messageViewModel.isPossibleShowButton = false
                }) {
                    HStack {
                        Text("아니요")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("LGreen"))
                                .font(.title)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20).stroke(Color("LGreen"), lineWidth: 3.5)
                    )
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(Animation.easeIn.delay(0.5)) {
                messageViewModel.isPossibleShowButton = true
            }
        }
    }

}
