//
//  MainView.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 02/11/21.
//

import SwiftUI

struct HomeView: View {
    let  topViewModel = TopsViewModel();
    let data = readLocalFile(forName: "AnimeDetailsMock")
    let details : Jikan.AnimeDetails?
    
    init(){
     
           details = try!   JSONDecoder().decode(Jikan.AnimeDetails.self,from: data!)
       
      
 
    }
    var body: some View {
        AnimeDetailsView(animeDetails: details!)
//        TabView{
//            TopAnimesView(topViewModel: topViewModel).tabItem{
//                Label("Animes", systemImage: "tv.fill")
//
//
//            }
//            TopMangasView(topViewModel: topViewModel).tabItem{
//                Label("Mangas", systemImage: "magazine.fill")
//
//
//
//            }
//            TopCharactersView(topViewModel: topViewModel).tabItem{
//                Label("Characters", systemImage: "person.3.fill")
//            }
//
//        }.accentColor(.purple).foregroundColor(.white)
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
