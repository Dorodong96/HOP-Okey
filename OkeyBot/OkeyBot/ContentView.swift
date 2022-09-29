//
//  ContentView.swift
//  OkeyBot
//
//  Created by Shin yongjun on 2022/09/20.
//

import SwiftUI

struct ContentView: View {
    let appearance: UITabBarAppearance = UITabBarAppearance()
    
    init() {
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().backgroundColor = UIColor.black.withAlphaComponent(0.1)
    }
    
    enum Tabs: String {
        case home = "홈"
        case profile = "프로필"
    }
    
    @State var tabSelection:Tabs = .home
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    TabView {
                        HomeView()
                            .tabItem{
                                if tabSelection == Tabs.home {
                                    Image(systemName: "house")
                                } else {
                                    Image(systemName: "house.fill")
                                }
                                Text("홈")
                            }
                        ProfileView()
                            .tabItem {
                                if tabSelection == Tabs.profile {
                                    Image(systemName: "person.crop.circle")
                                } else {
                                    Image(systemName: "person.crop.circle.fill")
                                }
                                Text("프로필")
                            }
                    }
                    .accentColor(.red)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
