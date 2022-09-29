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
                HStack {
                    Text("옥희")
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: "bubble.left.fill")
                        .font(.system(size: 32))
                        .foregroundColor(Color.red)
                }
                .padding([.top, .bottom], -30)
                

                ScrollView {
                    ForEach(messageViewModel.messages, id: \.self) { message in
                        if message.contains("[USER]") {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            
                            HStack {
                                Spacer()
                                
                                Text(newMessage)
                                    .padding(10)
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                                    .background(.blue.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10 )
                                
                            }
                        } else {
                            HStack {
                                Image("women")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle().stroke(.red, lineWidth: 3)
                                    }
                                    .padding(.leading, 10)
                                    .padding(.trailing, -10)
                                Text(message)
                                    .padding(10)
                                    .font(.system(size: 22))
                                    .background(.gray.opacity(0.4))
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
                .background(Color.gray.opacity(0 ))
                
                if(messageViewModel.index < 6 && messageViewModel.messages[messageViewModel.messages.count - 1].contains(survey.question[messageViewModel.index]))
                {
                    
                    ButtonView(messageViewModel: messageViewModel).padding()
                    
                }
                if(!messageViewModel.isPossiblebutton){KeyBoardView(messageViewModel: messageViewModel)}
            }.background(Color.gray.opacity(0.1 ))
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
