//
//  PickerFormView.swift
//  MartabakManis (macOS)
//
//  Created by David Gunawan on 29/07/21.
//

import SwiftUI

struct PickerFormView: View {
    @State private var menuSelected = 0
    @State private var radioSelected = 0
    @State private var segmentSelected = 0
    
    var body: some View {
        VStack {
            Text("Pilih baik-baik topping sesuai selera")
                .modifier(ExplanatoryText())
            
            Picker(selection: $menuSelected, label: Text("Pilih topping kesukaan:")) {
                Text("Pake Kacang").tag(1)
                Text("Ovomaltine Nutella").tag(2)
                Text("Srikaya").tag(3)
                Text("Cokelat, Keju, Kacang").tag(4)
                Text("Boba").tag(5)
            }
            .frame(width: 300)
            
            Divider().padding(.vertical)
            
            Text("Pilih ukuran berdasarkan kemampuan makanmu")
                .modifier(ExplanatoryText())
            
            GroupBox {
                Picker(selection: $radioSelected, label: Text("Pilih ukuran martabak:")) {
                    Text("Small").tag(0)
                    Text("Medium").tag(1)
                    Text("Large").tag(2)
                }
                .pickerStyle(RadioGroupPickerStyle())
            }
            
            Divider().padding(.vertical)
            
            Text("Pilih siapa yang mau masakin")
                .modifier(ExplanatoryText())
            
            Picker(selection: $segmentSelected, label: Text("Pilih pembuat:")) {
                Text("David").tag(0)
                Text("Phil").tag(1)
                Text("Viona").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .padding()
    }
}

struct PickerFormView_Previews: PreviewProvider {
    static var previews: some View {
        PickerFormView()
    }
}
