//
//  HomeView.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/28.
//

import SwiftUI

struct HomeView: View{
    @State private var isPresented = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 26))
                        .foregroundColor(Color.red.opacity(0.8))
                    Text("옥희봇")
                        .font(.system(size: 30))
                        .bold()
                    
                }
                .padding(15)
                
                Button {
                    self.isPresented.toggle()
                } label: {
                    Text("외로운 그대를 위해")
                        .font(.system(size: 33))
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red.opacity(0.8), lineWidth: 5)
                                .shadow(color: .gray, radius: 2, x: 2, y: 2))
                }
                .fullScreenCover(isPresented: $isPresented, content: LonleyBot.init)
                .font(.system(size: 20))
                .padding(30)
                
                Button {
                    self.isPresented.toggle()
                } label: {
                    Text("슬픈 그대를 위해")
                        .font(.system(size: 33))
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red.opacity(0.8), lineWidth: 5)
                                .shadow(color: .gray, radius: 2, x: 2, y: 2))
                }
                .fullScreenCover(isPresented: $isPresented, content: LonleyBot.init)
                
                .padding(30)
                
                Button {
                    self.isPresented.toggle()
                } label: {
                    Text("행복한 그대를 위해")
                        .font(.system(size: 33))
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red.opacity(0.8), lineWidth: 5)
                                .shadow(color: .gray, radius: 2, x: 2, y: 2))
                }
                .fullScreenCover(isPresented: $isPresented, content: LonleyBot.init)
                
                .padding(30)
                Spacer()
                    .navigationBarHidden(true)
                    .ignoresSafeArea(.all, edges: .bottom)
                
                
            }
            
        }
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
