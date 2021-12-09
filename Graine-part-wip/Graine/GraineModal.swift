//
//  GraineModal.swift
//  Graine
//
//  Created by laurent on 15/09/2021.
//

import SwiftUI

struct GraineModal: View {
    
    @Environment(\.presentationMode) private var  presentationMode

    
    var body: some View {
            VStack {
                Spacer()
                    .frame(height: 20)
                // ===============================
                Button(action: {
                    
                    self.presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Text("press to close")
                        .padding(10)
                        .foregroundColor(.black)
                        .background(Color .blue)
                        .cornerRadius(10)

                })
                Spacer()
                
                // ===============================
                
                
                
                
                
            }
        }
    }


struct GraineModal_Previews: PreviewProvider {
    static var previews: some View {
        GraineModal()
    }
}
