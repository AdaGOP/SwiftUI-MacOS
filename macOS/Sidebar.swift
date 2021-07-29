//
//  Sidebar.swift
//  MartabakManis (macOS)
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI

struct Sidebar: View {
    @State private var showSamplesSheet = false
    @ObservedObject private var menuList = MartabakService()
    
    private let openSamplesMenuItemSelected = NotificationCenter.default
        .publisher(for: .showSamples)
        .receive(on: RunLoop.main)
    
    var body: some View {
        List(Category.allCases) { category in
          NavigationLink(destination: ItemsListView()) {
            Label(category.name, systemImage: category.icon)
          }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 150, idealWidth: 300, maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 16)
        .modifier(ToolbarModifier())
        .sheet(isPresented: $showSamplesSheet, content: {
            FormView(isVisible: $showSamplesSheet)
        })
        .onReceive(openSamplesMenuItemSelected) { _ in
            showSamplesSheet.toggle()
        }
    }
}

struct ToolbarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        NotificationCenter.default.post(name: .showSamples, object: nil)
                    } ) {
                        Image(systemName: "uiwindow.split.2x1")
                    }
                }
            }
    }
}

extension Notification.Name {
    static let showSamples = Notification.Name("show_samples")
}
