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

    @State private var messages: [String] = ["옥희봇에 오신걸 환영합니다."]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {

                ScrollView(showsIndicators: false) {
                    ForEach(messageViewModel.messages, id: \.self) { message in
                        if message.contains("[USER]") {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            
                            HStack {
                                Spacer()
                                
                                Text(newMessage)
                                    .padding(10)
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                                    .background(.green.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10 )
                                
                            }
                        } else {
                            HStack {
                                Text(message)
                                    .padding(10)
                                    .font(.system(size: 22))
                                    .foregroundColor(.black.opacity(0.8))
                                    .background(.gray.opacity(0.1))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10 )
                                Spacer()
                            }
                        }
                    }
                    .rotationEffect(Angle(degrees: 180))
                }

                .rotationEffect(Angle(degrees: 180))
               // .background(Color.white.opacity(0 ))
                
                if(messageViewModel.index < 6 && messageViewModel.messages[messageViewModel.messages.count - 1].contains(survey.question[messageViewModel.index]) && messageViewModel.isPossibleShowButton)
                {
                    ButtonView(messageViewModel: messageViewModel).padding()
                        .transition(.scale)
                }
                if(!messageViewModel.isPossiblebutton){
                    KeyBoardView(messageViewModel: messageViewModel).padding()
                }
            }.background(Color.gray.opacity(0.1))
            .navigationTitle("옥희봇")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
//            .toolbar{
//                ToolbarItem(placement: .cancellationAction) {
//
//                Button(action: {presentationMode.wrappedValue.dismiss()}){
//                    Image(systemName: "arrow.left")
//                        .font(.system(size: 20))
//                        .foregroundColor(.blue)
//                }
//
//                }
//            }
        }
    }
    
}

struct LonleyBot_Previews: PreviewProvider {
    static var previews: some View {
        LonleyBot()
    }
}
