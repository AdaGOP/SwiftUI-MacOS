//
//  FormView.swift
//  MartabakManis (macOS)
//
//  Created by David Gunawan on 29/07/21.
//

import SwiftUI

struct FormView: View {
    @Binding var isVisible: Bool
    @State private var selectedTab = 0
    var body: some View {
        VStack {
            PickerFormView()
            Spacer()
            Button(action: {
                isVisible = false
            }) {
                Text("Close")
            }
            .keyboardShortcut(.defaultAction)
            .padding(.top, 10)
        }
        .padding()
        .frame(minWidth: 400, idealWidth: 400, maxWidth: .infinity, minHeight: 420, idealHeight: 420, maxHeight: .infinity)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(isVisible: .constant(true))
    }
}

struct ExplanatoryText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.secondary)
    }
}
