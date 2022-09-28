//
//  HomeView.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/28.
//

import SwiftUI

struct HomeView: View{
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Text("그대를 위해")
                        .font(.system(size: 30))
                        .bold()
                    Image(systemName: "face.smiling")
                        .font(.system(size: 26))
                        .foregroundColor(Color.red)
                }
                .padding()
                
                NavigationLink(destination: LonleyBot()) {
                    Text("외로운 그대를 위해")
                        .font(.system(size: 38))
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red, lineWidth: 5)
                                .shadow(color: .black, radius: 2, x: 2, y: 2))
                }
                .padding(20)
                NavigationLink(destination: LonleyBot()) {
                    Text("슬픈 그대를 위해")
                        .font(.system(size: 38))
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red, lineWidth: 5)
                                .shadow(color: .black, radius: 2, x: 2, y: 2))
                }
                .padding(20)
                
                NavigationLink(destination: LonleyBot()) {
                    Text("사랑이 고달 플 때")
                        .font(.system(size: 38))
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red, lineWidth: 5)
                                .shadow(color: .black, radius: 2, x: 2, y: 2))
                }
                .padding(20)
                Spacer()
                .navigationBarHidden(true)
            }
            
        }
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
