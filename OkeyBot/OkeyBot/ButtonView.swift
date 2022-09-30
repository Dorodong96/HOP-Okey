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
                    sendMessage(message: "[USER]" + survey.positveAnswer[messageViewModel.index])
                    messageViewModel.isPossibleShowButton = false
                }) {
                    HStack {
                        Text(survey.positveAnswer[messageViewModel.index])
                            .fontWeight(.semibold)
                            .foregroundColor(Color("LGray"))
                            .font(.title)
                    }
                    .frame(width: 80, height: 30)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20).fill(Color("CGreen"))
                    )
                    .background(Color("LGray"))
                }.padding()
                
                
                Button(action: {
                    sendMessage(message: "[USER]" + survey.negativeAnswer[messageViewModel.index])
                    messageViewModel.isPossibleShowButton = false
                }) {
                    HStack {
                        Text(survey.negativeAnswer[messageViewModel.index])
                            .fontWeight(.semibold)
                            .foregroundColor(Color("LGray"))
                                .font(.title)
                    }
                    .frame(width: 80, height: 30)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20).fill(Color("CGreen"))
                    )
                    .background(Color("LGray"))
                }.padding()
            }
        }
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
                messageViewModel.increaseIndex()
                messageViewModel.messages.append(survey.question[messageViewModel.index])
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(Animation.easeInOut.delay(0.5)) {
                messageViewModel.isPossibleShowButton = true
            }
            messageViewModel.isPossibleShowButton = true
        }
    }

}
