//
//  MenuCarouselView.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI

struct MenuCarouselView: View {
    
    let title: String
    let menus: [Menu]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.menus) { menu in
                        MenuCard(menu: menu)
                    }
                }
            }
        }
        
    }
}

struct MenuCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCarouselView(title: "Martabak Menu", menus: [Menu(id: "1", name: "Mantap", harga: 20000, gambar: [Gambar(id: "1", url: "https://dl.airtable.com/.attachments/a1f1b11a4e940823217a51b3fb1d0740/eb5bc690/monika-grabkowska-89HtiQoRgPc-unsplash.jpeg")], rating: 4.8, deskripsi: "NyamNyam")])
    }
}
