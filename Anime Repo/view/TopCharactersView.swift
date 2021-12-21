//
//  ContentView.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 02/11/21.
//

import SwiftUI

struct TopCharactersView: View {
    @ObservedObject var topViewModel  : TopsViewModel
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160, maximum:250),spacing: 8)]){
                ForEach(topViewModel.topCharacters){
                    character in
                    TopAnimeWidget(anime: character).aspectRatio(10/14, contentMode: .fit).task {
                        if(character == topViewModel.topCharacters.last){
                            await   topViewModel.getTopCharacters()
                        }
                    }
                    
                }
            }.padding(.horizontal,8).padding(.vertical,4)
            Spacer(minLength: 20)
            ProgressView().task {
                await topViewModel.getTopCharacters()
            }.deleteDisabled(false)
            Spacer(minLength: 20)
        }
    }
    
    
    
}


