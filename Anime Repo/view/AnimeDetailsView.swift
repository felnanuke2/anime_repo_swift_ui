//
//  AnimeDetailsView.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 21/12/21.
//

import SwiftUI
import URLImage

struct AnimeDetailsView: View {
    let animeDetails: Jikan.AnimeDetails
    
    var body: some View {
        ScrollView{
            VStack{
                AnimeDetailsHeader(animeDetails: animeDetails)
                SynopsysExpandable(synopsis: animeDetails.synopsis).padding(.vertical,16)
                ZStack{
                    RoundedRectangle(cornerRadius: 18).foregroundColor(.cyan)
                    GenresCards(genres: animeDetails.genres).padding()
                }
                
                Spacer()
            }.padding(16)
        }
    }
    
    
    struct GenreItem : View{
        let genre : Jikan.Genre
        var body: some View{
            ZStack{
                RoundedRectangle(cornerRadius: 8).stroke().foregroundColor(.white)
                Text(genre.name).font(.caption).padding(8).foregroundColor(.white)
            }
        }
    }
    
    
    struct GenresCards : View{
        let genres : [Jikan.Genre]
        var body: some View{
            VStack(alignment:.leading){
                Text("Genres").font(.title2).foregroundColor(.white).fixedSize().padding(.bottom,16)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80),spacing: 12)]){
                    ForEach(genres){ genre in
                        GenreItem(genre: genre)
                        
                    }
                }
            }
        }
    }
    
    
    struct ToogleSizeButton : View{
        let onTap : ()-> Void
        let expanded: Bool
        var body: some View{
            ZStack{
                Circle().foregroundColor(.cyan)
                Image(systemName:expanded ?  "arrow.up.to.line.circle" : "arrow.down.to.line.circle").font(.system(size: 38)).foregroundColor(.white).onTapGesture{
                    onTap()
                    
                }
            }.frame(width: 38, height: 38, alignment: .center)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.6)))
        }
    }
    
    
    struct SynopsysCard : View{
        let expanded: Bool
        let synopsis: String
        var body: some View{
            VStack(alignment:.leading){
                Text("Synopsis").font(.title2).padding(.bottom,16).foregroundColor(.white)
                ZStack(alignment:.bottom){
                    
                    Text(synopsis).lineLimit(expanded ?  nil : 6).font(.caption).foregroundColor(.white).padding(.bottom,16)
                    
                    
                    
                    if(!expanded){
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [
                                .cyan.opacity(1),
                                .cyan.opacity(0.6),
                                .cyan.opacity(0.1),
                                .cyan.opacity(0.01)
                                
                            ]
                                                                   ), startPoint: .bottom, endPoint: .top))
                            .frame(minHeight:60,maxHeight: 60)
                    }
                }
                
            }.padding(20).background(.cyan).cornerRadius(18) .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.6)))
        }
        
    }
    
    struct SynopsysExpandable : View{
        let synopsis: String
        @State  var expanded : Bool = false
        
        var body : some View{
            
            ZStack(alignment: .bottom){
                
                if(expanded){
                    SynopsysCard(expanded: expanded, synopsis: synopsis).padding(.bottom,19)
                }else{
                    SynopsysCard(expanded: expanded, synopsis: synopsis).padding(.bottom,19)
                }
                
                ToogleSizeButton(onTap: {
                    expanded = !expanded
                }, expanded:expanded)
                
                
                
            }
            
            
            
        }
    }
    
    
    struct AnimeDetailsHeader : View{
        let animeDetails: Jikan.AnimeDetails
        
        var body: some View{
            HStack{
                URLImage(URL(string: animeDetails.imageURL)!, identifier: animeDetails.imageURL){
                    image in
                    image.resizable().cornerRadius(18).aspectRatio(10/14, contentMode: .fit).frame( maxHeight: 150)
                    
                    
                    
                    
                }
                
                VStack(alignment: .leading){
                    Text(animeDetails.title).font(.title3).padding(.bottom,2)
                    Text(animeDetails.producers[0].name).padding(.bottom,2).font(.caption)
                    HStack{Image(systemName: "star.fill").foregroundColor(.yellow)
                        Text(String(format:"%.2f",animeDetails.score)).font(.body).padding(.leading,8)
                    }
                    Spacer()
                    
                }.padding(.leading, 16)
                Spacer()
            }.frame(maxHeight: 150)
        }
    }
}






struct AnimeDetailsView_Previews: PreviewProvider {
    let data = readLocalFile(forName: "AnimeDetailsMock")
    let details : Jikan.AnimeDetails?
    
    init(){
        
        details = try!   JSONDecoder().decode(Jikan.AnimeDetails.self,from: data!)
        
        
        
    }
    
    
    static var previews: some View {
        AnimeDetailsView(animeDetails: AnimeDetailsView_Previews().details! )
    }
}





