//
//  CustomTabView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct CustomTabView: View {
   
    init() {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().unselectedItemTintColor = UIColor(.grey3)
    }
    
    var body: some View {
        TabView {
            FirstEntryView()
//            SearchView()
                .tabItem {
                    TabItem(imageName: "searchIcon", title: "Поиск")
                }
            
            FavouriteView()
                .tabItem {
                    TabItem(imageName: "heartIcon", title: "Избранное")
                }
            
            ResponseView()
                .tabItem {
                    TabItem(imageName: "responseIcon", title: "Отклики")
                }
            
            MessageView()
                .tabItem {
                    TabItem(imageName: "messageIcon", title: "Сообщения")
                }
            
            ProfileView()
                .tabItem {
                    TabItem(imageName: "profileIcon", title: "Профиль")
                }
        }
        .tint(.blue)
    }
}

#Preview {
    CustomTabView()
}
