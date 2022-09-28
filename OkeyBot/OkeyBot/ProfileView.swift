//
//  ProfileView.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/28.
//

import SwiftUI
import SwiftUICharts

struct ProfileView: View {
    let chartStyle = ChartStyle(backgroundColor: Color.black, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.white, legendTextColor: Color.white, dropShadowColor: Color.black )

    
    var body: some View {
            VStack {
                HStack {
                    Text("프로필")
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 26))
                        .foregroundColor(Color.red)
                }
                .padding()
                
                Image("어르신")
                    .resizable()
                    .frame(width: 142, height: 142)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.red, lineWidth: 5)
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
                Text("월   화   수   목   금   토   일")
                    .font(.system(size: 32))
                    .foregroundColor(Color.black)
                    .padding(8)
                    .background(.red.opacity(0.3))
                        .cornerRadius(15)
                    
                Spacer()
            }
            .padding(20)
            
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
