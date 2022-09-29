//
//  ProfileView.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/28.
//

import SwiftUI
import SwiftUICharts

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    let chartStyle = ChartStyle(backgroundColor: Color.black, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.white, legendTextColor: Color.white, dropShadowColor: Color.black )
    
    
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
                
                
                VStack {
                    Text("김철수님")
                        .font(.system(.title))
                        .foregroundColor(Color.black)
                        .padding(1)
                    Text("행복한 하루에요!")
                        .font(.system(size: 20))
                    
                    //LineView(data: [10, 40, 100, 40, 60, 70, 80], title: "행복 수치")
                    BarChartView(data: ChartData(points: [8,23,54,32,12,37,7]), title: "행복 수치", form: ChartForm.large)
                    
                        .padding()
                    
                    BarChartView(data: ChartData(points: [80,60,4,5,50,10,40]), title: "우울 수치", style: chartStyle, form: ChartForm.large)
                    
                        .padding()
                    
                    
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
