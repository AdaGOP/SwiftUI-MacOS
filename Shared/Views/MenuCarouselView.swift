//
//  MenuCarouselView.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI

struct MenuCarouselView: View {
    
    let title: String
    let menus: [MenuRecord]
    
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

//struct MenuCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuCarouselView()
//    }
//}
