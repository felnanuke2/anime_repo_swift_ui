//
//  ContentView.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 02/11/21.
//

import SwiftUI

struct TopAnimesView: View {
    
    @ObservedObject var topViewModel  : TopsViewModel
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160, maximum:250),spacing: 8)]){
                ForEach(topViewModel.topAnimes){
                    anime in
                    TopAnimeWidget(anime: anime).aspectRatio(10/14, contentMode: .fit).task {
                        if(anime == topViewModel.topAnimes.last){
                            await   topViewModel.getTopAnimes()
                        }
                    }
                }
            }.padding(.horizontal,8).padding(.vertical,4)
            Spacer(minLength: 20)
            ProgressView().task {
                await topViewModel.getTopAnimes()
            }.deleteDisabled(false)
            Spacer(minLength: 20)
        }
    }
    
    
    
}


