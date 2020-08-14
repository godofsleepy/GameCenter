////
////  DetailView.swift
////  GameCenter
////
////  Created by rifat khadafy on 28/07/20.
////  Copyright © 2020 rifat khadafy. All rights reserved.
////
//
//import SwiftUI
//import SDWebImage
//import SDWebImageSwiftUI
//
//struct DetailView: View {
//    @ObservedObject var model: DetailViewModel
//    
//    var body: some View {
//        
//        ScrollView {
//            if model.detail != nil {
//                detail(model.detail!)
//            }
//            
//        }.background(Color(red: 37 / 255, green: 19 / 255, blue: 51 / 255)).edgesIgnoringSafeArea(.all)
//    }
//    
//    private func detail(_ data: DetailMap) -> some View {
//        ZStack(alignment: .top){
//            GeometryReader { geometry in
//                VStack {
//                    if geometry.frame(in: .global).minY <= 0 {
//                        WebImage(url: URL(string: data.background_image))
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
//                            .clipped()
//                            .offset(y: -geometry.frame(in: .global).minY)
//                    } else {
//                        WebImage(url: URL(string: data.background_image))
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: geometry.size.width, height: geometry.size.height)
//                            .clipped()
//                    }
//                }
//            }
//            .frame(height: 400)
//            .alignmentGuide(.top) { _ in 340 }
//            
//            HStack{
//                Spacer()
//                HStack{
//                    Text(String(format: "%.2f", data.rating))
//                        .font(.system(size: 18))
//                        .fontWeight(.regular)
//                        .foregroundColor(Color.white)
//                    Image("star.fill")
//                        .foregroundColor(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
//                }
//                .frame(width: 75, height: 30)
//                .background(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255))
//                .cornerRadius(10)
//                
//            }
//            .frame(minWidth: 0, maxWidth: .infinity)
//            .zIndex(1)
//            .padding(.trailing,32)
//            .alignmentGuide(.top) { _ in 15 }
//            
//            
//            VStack(alignment: .leading){
//                VStack(alignment: .leading) {
//                    Text(data.name)
//                        .fontWeight(.semibold)
//                        .font(.system(size: 24))
//                        .foregroundColor(.white)
//                    
//                    HStack{
//                        Text("Released \(data.released)")
//                            .fontWeight(.light)
//                            .font(.system(size: 16))
//                            .foregroundColor(.white)
//                        
//                        Image("calendar")
//                            .foregroundColor(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
//                    }
//                    
//                }.padding(.bottom)
//                
//                HStack(alignment: .center) {
//                    ForEach(data.genres.indices){ i in
//                        if (i < 2) {
//                            Text(data.genres[i].name)
//                                .font(.system(size: 20))
//                                .foregroundColor(.white)
//                                .fontWeight(.semibold)
//                            
//                        }
//                    }
//                    
//                }.frame(minWidth: 0, maxWidth: .infinity).padding(.bottom)
//                
//                Text(data.description.replacingOccurrences(of: "<[^>]+>", with: "" ,options: .regularExpression, range: nil))
//                    .foregroundColor(.white)
//                    .padding(16)
//                
//                Text("Platform")
//                    .foregroundColor(Color(red: 241 / 255, green: 79 / 255, blue: 114 / 255))
//                    .fontWeight(.semibold)
//                    .font(.system(size: 22))
//                
//                ScrollView(.horizontal){
//                    HStack{
//                        ForEach(data.parent_platforms.indices){ i in
//                            if (data.parent_platforms[i].platform.slug == "pc" || data.parent_platforms[i].platform.slug == "xbox" || data.parent_platforms[i].platform.slug == "playstation" || data.parent_platforms[i].platform.slug == "nintendo"){
//
//                                Image("logo\(data.parent_platforms[i].platform.slug)")
//                                    .background(Color(red: 247 / 255, green: 164 / 255, blue: 10 / 255))
//                                    .cornerRadius(100)
//
//                            }
//                        }
//                    }
//                }
//            }
//            .padding()
//            .background(RoundedCorners(color: Color(red: 37 / 255, green: 19 / 255, blue: 51 / 255), tl: 0, tr: 65, bl: 0, br: 0))
//            
//        }
//    }
//    
//    
//    
//}
