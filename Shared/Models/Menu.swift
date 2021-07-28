//
//  Menu.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import Foundation

struct Menu: Codable, Hashable {
    
    let id: String
    let name: String
    let harga: Int
    let gambar: [Gambar]
    let rating: Double
    let deskripsi: String
}

struct Gambar {
    let id: String
    let url: String
}
