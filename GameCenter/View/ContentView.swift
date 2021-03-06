//
//  ContentView.swift
//  GameCenter
//
//  Created by rifat khadafy on 12/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITableView.appearance().tableFooterView = UIView()
        //        Mengganti warna background list
        UITableView.appearance().backgroundColor = UIColor(red: 37/255.0, green: 19/255.0, blue: 51/255.0, alpha: 1.0)
        
        UITableViewCell.appearance().backgroundColor = UIColor(red: 37/255.0, green: 19/255.0, blue: 51/255.0, alpha: 1.0)
        
        UITabBar.appearance().barTintColor = UIColor(red: 37/255.0, green: 19/255.0, blue: 51/255.0, alpha: 10.0)
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red: 241/255.0, green: 79/255.0, blue: 114/255.0, alpha: 1.0)]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:UIColor(red: 241/255.0, green: 79/255.0, blue: 114/255.0, alpha: 1.0)]
    }
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        TabView{
            HomeView()
              .tabItem {
                 Image(systemName: "house.fill")
                 Text("Home")
            }
            
            SearchView()
              .tabItem {
                 Image(systemName: "magnifyingglass")
                 Text("Search")
            }
            
            FavoriteView()
                .tabItem {
                 Image(systemName: "heart.fill")
                 Text("Favorite")
            }
        }.accentColor(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255))

    }
    
    
}


