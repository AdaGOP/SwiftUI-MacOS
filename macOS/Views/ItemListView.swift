//
//  ItemListView.swift
//  MartabakManis (macOS)
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI

struct ItemsListView: View {
    
    @ObservedObject private var menuList = MartabakService()

    var body: some View {
        return view
          .frame(minWidth: 400, minHeight: 600)
          .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: { menuList.fetchMartabakList() }) {
                Image(systemName: "arrow.clockwise")
              }
              .keyboardShortcut("R", modifiers: .command)
            }
            ToolbarItem(placement: .automatic) {
              Button(action: {
                NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
              }) {
                Image(systemName: "sidebar.left")
              }
              .keyboardShortcut("S", modifiers: .command)
            }
          }
    }
    
    @ViewBuilder
    private var view: some View {
        List(menuList.menus) { item in
            MenuCarouselView(title: "", menus: menuList.menus)
        }.onAppear(perform: {
            menuList.fetchMartabakList()
        })
    }

}
