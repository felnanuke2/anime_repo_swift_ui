//
//  jikan.swift
//  Anime Repo
//
//  Created by LUIZ FELIPE ALVES LIMA on 02/11/21.
//

import Foundation
class Jikan{
    let baseApiUrl = "https://api.jikan.moe/v3";
    var animesPage = 0;
    var mangasPage = 0;
    var charactersPage = 0;
    
    func getTopAnimes() async throws -> [TopAnime]  {
        var topAnimes:[TopAnime] =  []
        animesPage+=1;
        let endPoint = "\(baseApiUrl)/top/anime/\(animesPage)/tv"
        let url = URL(string:endPoint)!
        let (data,_) = try await    URLSession.shared.data(from:url )
        
        let  topAnimeResponde = try  JSONDecoder().decode(TopAnimeResponse.self, from:data);
        
        topAnimes = topAnimeResponde.top;
        
        return topAnimes;
        
    }
    
    
    func getTopMangas() async throws -> [TopAnime]  {
        var topAnimes:[TopAnime] =  []
        mangasPage+=1;
        let endPoint = "\(baseApiUrl)/top/manga/\(mangasPage)/manga"
        let url = URL(string:endPoint)!
        let (data,_) = try await    URLSession.shared.data(from:url )
        
        let  topAnimeResponde = try  JSONDecoder().decode(TopAnimeResponse.self, from:data);
        
        topAnimes = topAnimeResponde.top;
        
        return topAnimes;
        
    }
    
    func getTopCharacters() async throws -> [TopAnime]  {
        var topAnimes:[TopAnime] =  []
        charactersPage+=1;
        let endPoint = "\(baseApiUrl)/top/characters/\(charactersPage)"
        let url = URL(string:endPoint)!
        let (data,_) = try await    URLSession.shared.data(from:url )
        
        let  topAnimeResponde = try  JSONDecoder().decode(TopAnimeResponse.self, from:data);
        
        topAnimes = topAnimeResponde.top;
        
        return topAnimes;
        
    }
    
    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let topAnimeResponse = try? newJSONDecoder().decode(TopAnimeResponse.self, from: jsonData)
    
    
    
    // MARK: - TopAnimeResponse
    class TopAnimeResponse: Codable {
        let requestHash: String
        let requestCached: Bool
        let requestCacheExpiry: Int
        let top: [TopAnime]
        
        enum CodingKeys: String, CodingKey {
            case requestHash = "request_hash"
            case requestCached = "request_cached"
            case requestCacheExpiry = "request_cache_expiry"
            case top
        }
        
        init(requestHash: String, requestCached: Bool, requestCacheExpiry: Int, top: [TopAnime]) {
            self.requestHash = requestHash
            self.requestCached = requestCached
            self.requestCacheExpiry = requestCacheExpiry
            self.top = top
        }
    }
    
    // MARK: - Top
    class TopAnime: Codable,Identifiable,Equatable {
        static func == (lhs: Jikan.TopAnime, rhs: Jikan.TopAnime) -> Bool {
            return lhs.malID == rhs.malID
        }
        
        let malID, rank: Int
        let title: String
        let url: String
        let imageURL: String
        let type: String?
        let episodes: Int?
        let startDate: String?
        let endDate: String?
        let members: Int?
        let score: Double?
        
        enum CodingKeys: String, CodingKey {
            case malID = "mal_id"
            case rank, title, url
            case imageURL = "image_url"
            case type, episodes
            case startDate = "start_date"
            case endDate = "end_date"
            case members, score
        }
        
        init(malID: Int, rank: Int, title: String, url: String, imageURL: String, type: String, episodes: Int?, startDate: String, endDate: String?, members: Int, score: Double) {
            self.malID = malID
            self.rank = rank
            self.title = title
            self.url = url
            self.imageURL = imageURL
            self.type = type
            self.episodes = episodes
            self.startDate = startDate
            self.endDate = endDate
            self.members = members
            self.score = score
        }
    }
    
    
    
    
    // MARK: - AnimeDetails
    class AnimeDetails: Codable {
        let requestHash: String
        let requestCached: Bool
        let requestCacheExpiry, malID: Int
        let url: String
        let imageURL: String
        let trailerURL: String
        let title, titleEnglish, titleJapanese: String
        
        let type, source: String
        let episodes: Int?
        let status: String
        let airing: Bool
        let aired: Aired
        let duration, rating: String
        let score: Double
        let scoredBy, rank, popularity, members: Int
        let favorites: Int
        let synopsis, background, premiered, broadcast: String
        let related: Related
        let producers, licensors, studios, genres: [Genre]
        
        let themes: [Genre]
        let openingThemes, endingThemes: [String]
        let externalLinks: [ExternalLink]
        
        enum CodingKeys: String, CodingKey {
            case requestHash = "request_hash"
            case requestCached = "request_cached"
            case requestCacheExpiry = "request_cache_expiry"
            case malID = "mal_id"
            case url
            case imageURL = "image_url"
            case trailerURL = "trailer_url"
            case title
            case titleEnglish = "title_english"
            case titleJapanese = "title_japanese"
            case type, source, episodes, status, airing, aired, duration, rating, score
            case scoredBy = "scored_by"
            case rank, popularity, members, favorites, synopsis, background, premiered, broadcast, related, producers, licensors, studios, genres
            case themes
            case openingThemes = "opening_themes"
            case endingThemes = "ending_themes"
            case externalLinks = "external_links"
        }
        
        init(requestHash: String, requestCached: Bool, requestCacheExpiry: Int, malID: Int, url: String, imageURL: String, trailerURL: String, title: String, titleEnglish: String, titleJapanese: String, type: String, source: String, episodes: Int, status: String, airing: Bool, aired: Aired, duration: String, rating: String, score: Double, scoredBy: Int, rank: Int, popularity: Int, members: Int, favorites: Int, synopsis: String, background: String, premiered: String, broadcast: String, related: Related, producers: [Genre], licensors: [Genre], studios: [Genre], genres: [Genre], themes: [Genre], openingThemes: [String], endingThemes: [String], externalLinks: [ExternalLink]) {
            self.requestHash = requestHash
            self.requestCached = requestCached
            self.requestCacheExpiry = requestCacheExpiry
            self.malID = malID
            self.url = url
            self.imageURL = imageURL
            self.trailerURL = trailerURL
            self.title = title
            self.titleEnglish = titleEnglish
            self.titleJapanese = titleJapanese
            self.type = type
            self.source = source
            self.episodes = episodes
            self.status = status
            self.airing = airing
            self.aired = aired
            self.duration = duration
            self.rating = rating
            self.score = score
            self.scoredBy = scoredBy
            self.rank = rank
            self.popularity = popularity
            self.members = members
            self.favorites = favorites
            self.synopsis = synopsis
            self.background = background
            self.premiered = premiered
            self.broadcast = broadcast
            self.related = related
            self.producers = producers
            self.licensors = licensors
            self.studios = studios
            self.genres = genres
            
            self.themes = themes
            self.openingThemes = openingThemes
            self.endingThemes = endingThemes
            self.externalLinks = externalLinks
        }
    }
    
    // MARK: - Aired
    class Aired: Codable {
    let from, to: String?
        let prop: Prop
        let string: String
        
        init(from: String, to: String, prop: Prop, string: String) {
            self.from = from
            self.to = to
            self.prop = prop
            self.string = string
        }
    }
    
    // MARK: - Prop
    class Prop: Codable {
        let from, to: From
        
        init(from: From, to: From) {
            self.from = from
            self.to = to
        }
    }
    
    // MARK: - From
    class From: Codable {
        let day, month, year: Int?
        
        init(day: Int, month: Int, year: Int) {
            self.day = day
            self.month = month
            self.year = year
        }
    }
    
    // MARK: - ExternalLink
    class ExternalLink: Codable {
        let name: String
        let url: String
        
        init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }
    
    // MARK: - Genre
    class Genre: Codable, Identifiable {
        let malID: Int
        let type: TypeEnum
        let name: String
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case malID = "mal_id"
            case type, name, url
        }
        
        init(malID: Int, type: TypeEnum, name: String, url: String) {
            self.malID = malID
            self.type = type
            self.name = name
            self.url = url
        }
    }
    
    enum TypeEnum: String, Codable {
        case anime = "anime"
        case manga = "manga"
    }
    
    // MARK: - Related
    class Related: Codable {
        let adaptation, sideStory, summary: [Genre]
        
        enum CodingKeys: String, CodingKey {
            case adaptation = "Adaptation"
            case sideStory = "Side story"
            case summary = "Summary"
        }
        
        init(adaptation: [Genre], sideStory: [Genre], summary: [Genre]) {
            self.adaptation = adaptation
            self.sideStory = sideStory
            self.summary = summary
        }
    }
    
    
    
    
    
    
    
    
}
