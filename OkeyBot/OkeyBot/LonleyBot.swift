//
//  lonleyBot.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/27.
//

import Foundation
import SwiftUI

struct LonleyBot: View {
    @State private var messageText = ""
    @StateObject var messageViewModel: MessageViewModel = MessageViewModel()
    
    let survey: Survey = Survey()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("옥희")
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: "bubble.left.fill")
                        .font(.system(size: 32))
                        .foregroundColor(Color.red)
                }
                .padding([.top, .bottom], -30)
                ScrollViewReader{
                    scrollView in
                ScrollView {
                    
                    ForEach(messageViewModel.messages, id: \.self) { message in
                        if message.contains("[USER]") {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            
                            HStack {
                                Spacer()
                                Text(newMessage)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.red.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10 )
                            }
                        } else {
                            HStack {
                                Text(message)
                                    .padding()
                                    .background(.gray.opacity(0.15))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10 )
                                Spacer()
                            }
//                                if(messageViewModel.index < 6 && message.contains(survey.question[messageViewModel.index]))
//                                {
//                                    ButtonView(messageViewModel: messageViewModel)
//
//                                }
                        }
                    }
                    .rotationEffect(Angle(degrees: 180))
                }
                .rotationEffect(Angle(degrees: 180))
                .background(Color.gray.opacity(0.10 ))
                }
                if(messageViewModel.index < 6 && messageViewModel.messages[messageViewModel.messages.count - 1].contains(survey.question[messageViewModel.index]))
                {
                    
                    ButtonView(messageViewModel: messageViewModel)
                    
                }
                if(!messageViewModel.isPossiblebutton){KeyBoardView(messageViewModel: messageViewModel)}
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
   
}

struct LonleyBot_Previews: PreviewProvider {
    static var previews: some View {
        LonleyBot()
    }
}
