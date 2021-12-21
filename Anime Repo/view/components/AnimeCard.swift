//
//  AnimeCard.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 21/12/21.
//

import SwiftUI
import URLImage

struct TopAnimeWidget: View{
    let anime : Jikan.TopAnime;
    
    var body: some View{
        ZStack{
            URLImage(URL(string: anime.imageURL)!, identifier: anime.imageURL){
                image in
                image.resizable().cornerRadius(18)
            }
            VStack{
                Spacer()
                Rectangle().frame( height: 80).foregroundColor(.white.opacity(0.0)).background(LinearGradient(colors: [.black.opacity(0.8),.black.opacity(0.0)], startPoint: .bottom, endPoint:.top)).cornerRadius(18)
                
            }
            VStack{
                HStack{
                    Spacer()
                    if(anime.score != nil){
                        Text("\( anime.score!,specifier: "%.2f")").font(.subheadline.bold()).foregroundColor(.white).padding(.all,8).background(.teal).cornerRadius(18)
                    }
                    
                }.padding(.vertical,8).padding(.trailing,4)
                Spacer()
                Text(anime.title).lineLimit(2).foregroundColor(.white).font(.body.bold())
                
            }.padding(.bottom, 12).padding(.horizontal,8)
            
            
            
        }
    }
}
