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
            HStack{
                Button(action: {
                    messageViewModel.increaseIndex()
                    messageViewModel.messages.append(survey.question[messageViewModel.index])
                    
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
                    if(messageViewModel.index < 5 ){
                    messageViewModel.messages.append(survey.question[messageViewModel.index])
                    }
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
    }
}
