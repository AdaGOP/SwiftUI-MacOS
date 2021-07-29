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
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 4)
            VStack {
                if self.imageCacher.image != nil {
                    Image(nsImage: self.imageCacher.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 204, height: 230)
                        .cornerRadius(8)
                        
                }
                
                VStack {
                    Text("Rating " + String(menu.fields.rating)).multilineTextAlignment(.center)
                    Text(menu.fields.nama)
                        .multilineTextAlignment(.center)
                    Text("Rp. " + String(menu.fields.harga.formattedWithSeparator)).multilineTextAlignment(.center)
                }
                
            }
        }
        .onAppear {
            
            self.imageCacher.loadImage(with: URL(string: self.menu.fields.gambar)!)
        }
        .frame(width: 204, height: 306)
    }
}

struct MenuCard_Previews: PreviewProvider {
    static var previews: some View {
        MenuCard(menu: MenuRecord(id: "", fields: Menu(nama: "Martabak Mantap", deskripsi: "Enak Banget", harga: 70000, gambar: "https://dl.airtable.com/.attachments/a1f1b11a4e940823217a51b3fb1d0740/eb5bc690/monika-grabkowska-89HtiQoRgPc-unsplash.jpeg", rating: 4.7), createdTime: ""))
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
