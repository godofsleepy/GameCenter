//
//  FavoriteView.swift
//  GameCenter
//
//  Created by rifat khadafy on 18/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 37 / 255, green: 19 / 255, blue: 51 / 255).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            print("got it")
                        }, label: {
                            Text("+").font(.system(.largeTitle))
                            .frame(width: 47, height: 40)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                        }).background(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
                        .cornerRadius(38.5)
                        .padding()
                    }
                }
            }
            
        .navigationBarTitle("Favorite")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
