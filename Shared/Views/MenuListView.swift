//
//  MenuListView.swift
//  MartabakManis
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI

struct MenuListView: View {
    
    @ObservedObject private var menuList = MartabakService()
    
    var body: some View {
        NavigationView {
            List {
                MenuCarouselView(title: "Menu Martabak", menus: menuList.menus)
            }.navigationBarTitle("Martabak Manis")
        }
        .onAppear(perform: {
            self.menuList.fetchMartabakList()
        })
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
