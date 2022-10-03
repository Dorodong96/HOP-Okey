//
//  ProfileView.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/28.
//

import SwiftUI
import Charts

struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
}

struct ProfileView: View {
    let items: [Item] = [
        Item(type: "월요일", value: 20),
        Item(type: "화요일", value: 40),
        Item(type: "수요일", value: 70),
        Item(type: "목요일", value: 30),
        Item(type: "금요일", value: 60),
        Item(type: "토요일", value: 25),
        Item(type: "일요일", value: 15)
    ]
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image("어르신")
                    .resizable()
                    .frame(width: 142, height: 142)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color("LGreen"), lineWidth: 5)
                    }
                    .padding(30)
                
                Text("김철수님")
                    .font(.system(.title))
                    .foregroundColor(Color.black)
                    .padding(.top, 10)
                
                Text("오늘도 행복하세요!")
                
                VStack {
                    HStack {
                        Text("행복 수치")
                            .foregroundColor(Color("LGreen"))
                            .font(.system(size: 20))
                            .padding(20)
                        Spacer()
                    }
                    
                    Chart {
                        ForEach(items) { item in
                            BarMark(
                                x: .value("요일", item.type),
                                y: .value("행복 지수", item.value))
                            .foregroundStyle(Color("LGreen"))
                        }
                    }
                    .chartXAxis(.visible)
                    .frame(width: 340, height: 170, alignment: .center)
                    Spacer()
                }
                
            }
            .navigationTitle("프로필")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { presentationMode.wrappedValue.dismiss()}){
                        Image(systemName: "chevron.left")
                            .font(.system(size: 25))
                            .foregroundColor(Color("LGreen"))
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
