//
//  MenuCard.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI
import Cocoa

struct MenuCard: View {
    
    let menu: MenuRecord
    
    @ObservedObject var imageCacher = ImageCacher()
    
    init(menu: MenuRecord) {
        self.menu = menu
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 4)
            HStack {
                Image(nsImage: imageCacher.image!) 
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)

                Text(menu.fields.nama)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 204, height: 306)
    }
}

struct MenuCard_Previews: PreviewProvider {
    static var previews: some View {
        MenuCard(menu: MenuRecord(id: "", fields: Menu(nama: "Martabak Mantap", deskripsi: "Enak Banget", harga: 70000, gambar: "https://dl.airtable.com/.attachments/a1f1b11a4e940823217a51b3fb1d0740/eb5bc690/monika-grabkowska-89HtiQoRgPc-unsplash.jpeg", rating: 4.7), createdTime: ""))
    }
}
