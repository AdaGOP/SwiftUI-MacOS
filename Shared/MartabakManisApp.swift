//
//  MartabakManisApp.swift
//  Shared
//
//  Created by David Gunawan on 28/07/21.
//

import SwiftUI

@main
struct MartabakManisApp: App {
    
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            NavigationView {
                Sidebar()
            }
            #else
            NavigationView{
                ContentView()
            }.navigationBarTitle("Martabak Manis")
            #endif
        }
//        .commands {
//            #if os(macOS)
//            NavigationView {
//                MartabakCommand()
//            }
//            #endif
//        }
    }
}
