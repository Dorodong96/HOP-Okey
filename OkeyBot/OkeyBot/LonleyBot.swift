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
                            if(messageViewModel.index < 6 && message.contains(survey.question[messageViewModel.index]))
                            {
                                ButtonView(messageViewModel: messageViewModel)
                                
                            }
                        }
                    }
                    .rotationEffect(.degrees(180))
                }
                .rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
                
                HStack {
                    TextField("옥희에게 말을 걸어주세요.", text: $messageText)
                        .font(.system(size: 22))
                        .padding(10)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                        .onSubmit {
                            sendMessage(message: messageText)
                        }
                    Button {
                        sendMessage(message: messageText)
                       // messageViewModel.messages.append(survey.question[messageViewModel.index])
                      //  messageViewModel.increaseIndex()
                    } label: {

                        messageViewModel.isPossiblebutton ? Image(systemName: "paperplane.fill").foregroundColor(Color.gray) : Image(systemName: "paperplane.fill").foregroundColor(Color.red.opacity(0.7))

                    }
                    .disabled(messageViewModel.isPossiblebutton)
                    .font(.system(size: 32))
                    .padding(.horizontal, 10)
                    
                }
                .padding(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .navigationTitle("옥희봇")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("나가기")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                
                
            }
        }
    }
    func sendMessage(message: String) {
        withAnimation {
            messageViewModel.messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messageViewModel.messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct LonleyBot_Previews: PreviewProvider {
    static var previews: some View {
        LonleyBot()
    }
}
