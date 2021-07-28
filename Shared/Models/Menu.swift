//
//  Menu.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import Foundation

struct MenuRecords: Codable {
    var records: [Menu]
}

struct Menu: Codable, Identifiable {
    let id: String
    let name: String
    let harga: Int
    let gambar: [Gambar]
    let rating: Double
    let deskripsi: String
}

struct Gambar: Codable {
    let id: String
    let url: String
}
