//
//  Menu.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import Foundation

struct MenuRecords: Codable {
    let records: [MenuRecord]
}

struct MenuRecord: Codable, Identifiable {
    let id: String
    let fields: Menu
    let createdTime: String
}

struct Menu: Codable {
    let nama, deskripsi: String
    let harga: Int
    let gambar: String
    let rating: Double
}

