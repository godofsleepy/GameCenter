//
//  FavoriteView.swift
//  GameCenter
//
//  Created by rifat khadafy on 18/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: GameFav.entity(), sortDescriptors: []) var games : FetchedResults<GameFav>
    
    var body: some View {
        NavigationView{
            VStack {
                List {
                    ForEach(games, id:\.self){ game in
                        NavigationLink(destination: FavoriteDetailView(data: game)){
                            FavGameItemView(game: game)
                        }
                    }.onDelete(perform: removeGames)
                }
                
            }
                
            .navigationBarTitle("Favorite")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func removeGames(at offsets: IndexSet) {
        for index in offsets {
            let game = games[index]
            moc.delete(game)
        }
        
        try? moc.save()
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
