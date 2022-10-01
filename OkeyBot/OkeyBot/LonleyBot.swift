//
//  lonleyBot.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/27.
//

import Foundation
import SwiftUI

struct LonleyBot: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var messageText = ""
    @State private var isPresented = false
    @State private var messages: [String] = ["옥희봇에 오신걸 환영합니다."]
    @StateObject var messageViewModel: MessageViewModel = MessageViewModel()
    
    let survey: Survey = Survey()
    
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
                                    .background(Color("AGreen"))
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
                                    .background(Color(UIColor.systemGray5))
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
                
                if(messageViewModel.index < 5 && messageViewModel.messages[messageViewModel.messages.count - 1].contains(survey.question[messageViewModel.index]) && messageViewModel.isPossibleShowButton)
                {
                   
                    ButtonView(messageViewModel: messageViewModel).padding()
//                        .transition(.move(edge: .bottom))
                }
                if(!messageViewModel.isPossiblebutton){
                    KeyBoardView(messageViewModel: messageViewModel).padding()
                }
            }.background(Color("LGray"))
                .navigationTitle("옥희봇")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { self.isPresented.toggle()}){
                            Image(systemName: "person.circle")
                                .font(.system(size: 25))
                                .foregroundColor(Color("LGreen"))
                        }.fullScreenCover(isPresented: $isPresented, content: ProfileView.init)
                    }
                }
        }
    }
    
}

struct LonleyBot_Previews: PreviewProvider {
    static var previews: some View {
        LonleyBot()
    }
}
