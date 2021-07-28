//
//  MenuCard.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI

struct MenuCard: View {
    
    let menu: Menu
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 4)
            
            Text(menu.name)
                .multilineTextAlignment(.center)
        }
        .frame(width: 204, height: 306)
    }
}

struct MenuCard_Previews: PreviewProvider {
    static var previews: some View {
        MenuCard(menu: Menu(id: "1", name: "Mantap", harga: 20000, gambar: [Gambar(id: "1", url: "https://dl.airtable.com/.attachments/a1f1b11a4e940823217a51b3fb1d0740/eb5bc690/monika-grabkowska-89HtiQoRgPc-unsplash.jpeg")], rating: 4.8, deskripsi: "NyamNyam"))
    }
}
