//
//  ContentView.swift
//  GameCenter
//
//  Created by rifat khadafy on 12/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI


struct ContentView: View {
    @ObservedObject var model = GamesListViewModel()
    @State var index = 0
    @State var selection: Int? = nil
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        //        Mengganti warna background list
        UITableView.appearance().backgroundColor = UIColor(red: 37/255.0, green: 19/255.0, blue: 51/255.0, alpha: 1.0)
        
        UITableViewCell.appearance().backgroundColor = UIColor(red: 37/255.0, green: 19/255.0, blue: 51/255.0, alpha: 1.0)
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red: 241/255.0, green: 79/255.0, blue: 114/255.0, alpha: 1.0)]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:UIColor(red: 241/255.0, green: 79/255.0, blue: 114/255.0, alpha: 1.0)]
    }
    
    
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color(red: 37 / 255, green: 19 / 255, blue: 51 / 255).edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255), lineWidth: 5)
                        
                        HStack {
                            Button(action: {
                                print("Left")
                                self.index -= 1
                                if self.index < 0{
                                    self.index = 3
                                }
                                //                                self.model.fetchListGames(id: dataPlatforms[self.index].id)
                            }) {
                                Image("chevron.left")
                                    .foregroundColor(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
                            }
                            
                            CarouselView(index: self.$index.animation(), maxIndex: 3) {
                                ForEach(dataPlatforms, id: \.self) { platform in
                                    Image(platform.image)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            
                            Button(action: {
                                print("Right")
                                self.index += 1
                                if self.index == 4{
                                    self.index = 0
                                }
                                //                                self.model.fetchListGames(id: dataPlatforms[self.index].id)
                            }) {
                                Image("chevron.right")
                                    .foregroundColor(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
                            }
                        }
                        .padding(10)
                        
                        VStack(alignment: .leading) {
                            Text("platform")
                                .foregroundColor(Color.white).font(.system(size: 16))
                            Text(dataPlatforms[self.index].name)
                                .foregroundColor(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255)).font(.system(size: 33,weight: .semibold))
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 80, alignment: .topLeading)
                        .padding(30)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 250, maxHeight: 250)
                    .padding(.bottom)
                    
                    Text("Featured")
                        .foregroundColor(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255))
                        .font(.system(size: 24))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    VStack{
                        content
                    }
                    
                    //                        VStack{
                    //                            ForEach(self.model.games){ game in
                    //                                NavigationLink(destination: DetailView(model: DetailViewModel(gameid: String(game.id)))){
                    //                                    GameItemView(game: game)
                    //                                }
                    //                            }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    //                        }
                    
                }
                .padding(24)
                
                
            } // ZStack
                .navigationBarTitle("Home")
                .navigationBarItems(leading: Button(action: {
                    print("Edit button pressed...")
                }) {
                    Image(systemName: "magnifyingglass").foregroundColor(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255))
                        .font(.system(size: 26))
                    }, trailing: NavigationLink(destination: ProfileView(),tag: 1,selection: $selection){
                        Button(action: {
                            self.selection = 1
                        }) {
                            Image(systemName: "info.circle").foregroundColor(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255)).font(.system(size: 26))
                        }
                })
        }.onAppear {self.model.send(event: .onAppear)}
    }
    
    private var content: some View {
        switch model.state {
        case .idle:
            return Color.clear.eraseToAnyView()
        case .loading:
            return Spinner(isAnimating: true, style: .large).eraseToAnyView()
        case .error(let error):
            return Text(error.localizedDescription).eraseToAnyView()
        case .loaded(let games):
            return list(of: games).eraseToAnyView()
        }
    }
    
    private func list(of games: [GamesListViewModel.ListGame]) -> some View {
        return ForEach(games){ game in
            GameItemView(game: game)
        }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0,trailing: 0))
    }
}


