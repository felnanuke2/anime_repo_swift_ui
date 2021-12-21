//
//  top_animes.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 02/11/21.
//

import Foundation
import UIKit
class TopsViewModel: ObservableObject{
    
    private let model = Jikan();
    
    
    @Published<[Jikan.TopAnime]> var topAnimes : [Jikan.TopAnime] = [];
    @Published<[Jikan.TopAnime]> var topMangas : [Jikan.TopAnime] = [];
    @Published<[Jikan.TopAnime]> var topCharacters : [Jikan.TopAnime] = [];
    @Published var loading = false;
    
    
    @MainActor
    func getTopAnimes()  async  {
        loading = true
        do {
            let animes = try await model.getTopAnimes()
            loading = false
            topAnimes += animes
            
        }catch let e {
            print(String(describing: e))
            
        }
    }
    
    @MainActor
    func getTopMangas()  async  {
        loading = true
        do {
            let mangas = try await model.getTopMangas()
            loading = false
            topMangas += mangas
            
        }catch let e {
            print(String(describing: e))
            
        }
    }
    
    @MainActor
    func getTopCharacters()  async  {
        loading = true
        do {
            let characters = try await model.getTopCharacters()
            loading = false
            topCharacters += characters
            
        }catch let e {
            print(String(describing: e))
            
        }
    }
    
    
    
    
}
