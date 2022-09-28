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
    @State private var messages: [String] = ["옥희봇에 오신걸 환영합니다."]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("옥희")
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: "bubble.left.fill")
                        .font(.system(size: 26))
                        .foregroundColor(Color.red)
                }
                .padding([.top, .bottom], -30)
                
                
                ScrollView {
                    ForEach(messages, id: \.self) { message in
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
                        }
                    }
                    .rotationEffect(.degrees(180))
                }
                .rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10 ))
                
                HStack {
                    TextField("입력해주세요.", text: $messageText)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .onSubmit {
                            sendMessage(message: messageText)
                        }
                    Button {
                         sendMessage(message: messageText)
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(Color.red)
                    }
                    .font(.system(size: 26))
                    .padding(.horizontal, 10)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct LonleyBot_Previews: PreviewProvider {
    static var previews: some View {
        LonleyBot()
    }
}
