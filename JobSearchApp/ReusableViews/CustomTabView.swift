//
//  CustomTabView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct CustomTabView: View {
    @EnvironmentObject var enterData: EnterData
    @State private var badge: Int = 0
    
    var formattedBadge: String? {
        if badge > 99 {
            return "99+"
        } else if badge == 0 {
            return nil
        } else {
            return badge.description
        }
    }
    
    init() {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().unselectedItemTintColor = UIColor(.grey3)
    }
    
    let items: [TabItem] = [
        TabItem(imageName: "searchIcon", title: "Поиск"),
        TabItem(imageName: "heartIcon", title: "Избранное"),
        TabItem(imageName: "responseIcon", title: "Отклики"),
        TabItem(imageName: "messageIcon", title: "Сообщения"),
        TabItem(imageName: "profileIcon", title: "Профиль")
    ]
    
    var body: some View {
        if enterData.isLoggedIn {
            TabView {
                SearchView()
                    .tabItem {
                        TabItem(imageName: "searchIcon", title: "Поиск")
                    }
                
                FavouriteView()
                    .badge(formattedBadge)
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
            .tint(.specialBlue)
        } else {
            TabView {
                ForEach(items.indices, id: \.self) { index in
                    FirstEntryView()
                        .environmentObject(enterData)
                        .tabItem {
                            items[index]
                        }
                }
            }
            .tint(.blue)
        }
    }
}

#Preview {
    CustomTabView()
}
