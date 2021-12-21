//
//  ContentView.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 02/11/21.
//

import SwiftUI

struct TopMangasView: View {
    @ObservedObject var topViewModel  : TopsViewModel
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160, maximum:250),spacing: 8)]){
                ForEach(topViewModel.topMangas){
                    manga in
                    TopAnimeWidget(anime: manga).aspectRatio(10/14, contentMode: .fit).task {
                        if(manga == topViewModel.topMangas.last){
                            await   topViewModel.getTopMangas()
                        }
                    }
                    
                }
            }.padding(.horizontal,8).padding(.vertical,4)
            Spacer(minLength: 20)
            ProgressView().task {
                await topViewModel.getTopMangas()
            }.deleteDisabled(false)
            Spacer(minLength: 20)
        }
    }
    
    
    
}


