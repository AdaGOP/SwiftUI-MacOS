//
//  MartabakService.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import Foundation

class MartabakService: ObservableObject {
    
    @Published var menus = [MenuRecord]()
    
    private let apiKey = "keymz7z6uRztZlYlm"
    private let baseURL = URL(string: "https://api.airtable.com/v0/appWlXU69Ax8IqbNn/Daftar%20Menu?")
    private let decoder = JSONDecoder()
    
    func fetchMartabakList() {
        if let url = baseURL {
            guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
            let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
            urlComponents.scheme = "https"
            urlComponents.queryItems = queryItems
            guard let finalURL = urlComponents.url else { return }
            URLSession.shared.dataTask(with: finalURL) { (data, res, err) in
                if let mentorList = data, err == nil {
                    do{
                        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let results = try self.decoder.decode(MenuRecords.self, from: mentorList)
                        DispatchQueue.main.async {
                            self.menus = results.records
                        }
                    } catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let jsonError{
                        print(jsonError.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}
