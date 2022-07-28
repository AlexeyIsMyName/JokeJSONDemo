//
//  JokeManager.swift
//  JokeJSONDemo
//
//  Created by ALEKSEY SUSLOV on 29.07.2022.
//

import Foundation

struct Joke: Decodable {
    let setup: String
    let punchline: String
}

struct JokeManager {
    private let jokeURL = "https://joke.deno.dev/"
    
    func fetchJoke(completion: @escaping (String?, String?) -> Void) {
        
        if let url = URL(string: jokeURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    return
                }
                
                if let safeData = data {
                    if let joke = parseJSON(safeData) {
                        completion(joke.setup, joke.punchline)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    private func parseJSON(_ jokeData: Data) -> Joke? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Joke.self, from: jokeData)
            let joke = decodedData
            
            return joke
        } catch {
            return nil
        }
    }
}
