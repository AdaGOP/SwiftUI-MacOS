//
//  Sidebar.swift
//  MartabakManis (macOS)
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI

struct Sidebar: View {
    @ObservedObject private var menuList = MartabakService()
    var body: some View {
        List(Category.allCases) { category in
          NavigationLink(destination: ItemsListView()) {
            Label(category.name, systemImage: category.icon)
          }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 150, idealWidth: 300, maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 16)
    }
}
