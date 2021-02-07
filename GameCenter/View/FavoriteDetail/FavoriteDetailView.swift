//
//  FavoriteDetailView.swift
//  GameCenter
//
//  Created by rifat khadafy on 21/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FavoriteDetailView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: GameFav.entity(), sortDescriptors: []) var games : FetchedResults<GameFav>
    
    var data : GameFav
    var body: some View {
        ScrollView {
            ZStack(alignment: .top){
                GeometryReader { geometry in
                    VStack {
                        if geometry.frame(in: .global).minY <= 0 {
                            WebImage(url: URL(string: self.data.wrappedImage))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                .clipped()
                                .offset(y: -geometry.frame(in: .global).minY)
                        } else {
                            WebImage(url: URL(string:  self.data.wrappedImage))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                        }
                    }
                }
                .frame(height: 400)
                .alignmentGuide(.top) { _ in 340 }
                
                HStack{
                    Spacer()
                    HStack{
                        Text(String(format: "%.2f", self.data.wrappedRating))
                            .font(.system(size: 18))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                        Image("star.fill")
                            .foregroundColor(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
                    }
                    .frame(width: 75, height: 30)
                    .background(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255))
                    .cornerRadius(10)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .zIndex(1)
                .padding(.trailing,32)
                .alignmentGuide(.top) { _ in 15 }
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading) {
                        Text(self.data.wrappedName)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        
                        HStack{
                            Text("Released \(self.data.wrappedReleased)")
                                .fontWeight(.light)
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                            
                            Image("calendar")
                                .foregroundColor(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
                        }
                        
                    }.padding(.bottom)
                    
                    HStack(alignment: .center) {
                        ForEach(self.data.genreArray.indices){ i in
                            if (i < 2) {
                                Text(self.data.genreArray[i])
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                    }.frame(minWidth: 0, maxWidth: .infinity).padding(.bottom)
                    
                    Text(data.wrappedDesc.replacingOccurrences(of: "<[^>]+>", with: "" ,options: .regularExpression, range: nil))
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
                    Text("Platform")
                        .foregroundColor(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255))
                        .fontWeight(.semibold)
                        .font(.system(size: 22))
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(data.platformArray.indices){ i in
                                if (self.data.platformArray[i] == "pc" || self.data.platformArray[i] == "xbox" || self.data.platformArray[i] == "playstation" || self.data.platformArray[i] == "nintendo"){
                                    
                                    Image("logo\(self.data.platformArray[i])")
                                        .background(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
                                        .cornerRadius(100)
                                }
                            }
                        }
                    }
                    
                }
                .padding()
                .background(RoundedCorners(color: Color(red: 37 / 255, green: 19 / 255, blue: 51 / 255), tl: 0, tr: 65, bl: 0, br: 0))
                
            }
        }.background(Color(red: 37 / 255, green: 19 / 255, blue: 51 / 255)).edgesIgnoringSafeArea(.all)
        
    }
    
    
}
