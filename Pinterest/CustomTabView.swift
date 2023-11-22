//
//  CustomTabView.swift
//  Pinterest
//
//  Created by Vincenza Loreto on 15/11/23.
//

import SwiftUI

struct CustomTabView: View {
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.black


        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    var body: some View {
        TabView {
            PinterestStyleLayout()
                .tabItem {
                    Image(systemName: "house")
                   
                }

            Text("Second page")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                  
                }

            Text("Third page")
                .tabItem {
                    Image(systemName: "plus")
                  
                }

            Text("Fourth page")
                .tabItem {
                    Image(systemName: "message")
                  
                }

            Text("Fifth page")
                .tabItem {
                    Image(systemName: "person.fill")
                   
                }
        }
        .accentColor(.white)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CustomTabView()
}


//test
