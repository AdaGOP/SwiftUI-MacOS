//
//  MartabakService.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import Foundation

class MartabakService: ObservableObject {
    
    @Published var menus = [MenuRecord]()
    
    let endpointURL = URL(string: "https://api.airtable.com/v0/appWlXU69Ax8IqbNn/Daftar%20Menu?api_key=keymz7z6uRztZlYl")
    let decoder = JSONDecoder()
    
    func fetchMartabakList() {
        if let url = endpointURL {
            URLSession.shared.dataTask(with: url) { (data, res, err) in
                if let mentorList = data, err == nil {
                    do{
                        let results = try self.decoder.decode(MenuRecords.self, from: mentorList)
                        DispatchQueue.main.async {
                            self.menus = results.records
                        }
                    }catch let jsonError{
                        print(jsonError.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}
