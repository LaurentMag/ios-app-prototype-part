//
//  TablBordNivMat.swift
//  Graine
//
//  Created by laurent on 21/09/2021.
//

import SwiftUI

struct TablBordNivMat: View {
    
    
    // Binding bazar ----------------------------------
    @Binding var buttonNumModal2: Int // <-- buttonNumModal <-- buttonNum ORI ||| valeur bouton tableau de bord
    @Binding var buttonMatNiv: Int // <-- buttonNumNivMat ||| valeur bindé bouton matière & niveau
    @Binding var displayNavMod: Bool // <-- showModNivMat ORI ||| bool  display mat niv modal pour bouton fermer
    // Binding bazar ----------------------------------
    
    
    var selectArrayNM: ModNivMatStruct {
        ModNivMatFunc(boutonValue: buttonMatNiv) // computed  prop change array listé en fonction bouton matière/ niveau
    }
    
    
    var body: some View {
        ZStack { // ---------------------- ZSTACK Main ----------------------
            Color("ardoise").edgesIgnoringSafeArea(.top)
            VStack {  // ---------------------- VSTACK Main ----------------------
                Spacer()
                    .frame(height: 30)
                VStack {
                    Button(action: {
                        
                        displayNavMod = false
                        
                    }, label: {
                        ZStack {
                            Image(systemName: selectArrayNM.iconEntete)
                                .font(.system(size: 70))
                                .foregroundColor(.white)
                            
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .offset(x: 50, y: -45)
                        }
                    })
                }
                .padding(.bottom, 25)
                Divider().frame(width: 300)
                Divider().frame(width: 300)
                    .padding(.bottom, 25)
                
                
                VStack { // ---------------------- VSTACK 2 ----------------------
                    NavigationView {
                        
                        List(selectArrayNM.arraySelect, id: \.self) { firstListItem in
                            
                            NavigationLink(
                                destination: TablBordNivMat2(buttonNumModal3: $buttonNumModal2, buttonMatNiv2: $buttonMatNiv, displayNavMod2: $displayNavMod, matNivTxtRecu1: firstListItem),
                                
                                
                                
                                
                                
                                
                                label: {
                                    HStack {
                                        Spacer()
                                            .frame(width: 25)
                                    Text(firstListItem.description.capitalized)
                                        .bold()
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                                        .padding(8)
                                        Spacer()
                                    }
                                    .font(.system(size: 22))
                                    .background(Color("turquoise2"))
                                    .cornerRadius(10)
                                })
                        }
                        .navigationTitle(selectArrayNM.navTitre)
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }
                    
                    
                    
                } // ---------------------- VSTACK 2 END ----------------------
            }   // ---------------------- VSTACK Main END ----------------------
    
            VStack {
            Spacer()
            ImageResisable(imageName: "leaf.fill", widthIF: 50, heightIF: 45, fontSize: 50, backgColor: "pourpre2")
                .padding(.bottom, 25)

            }
        } // ---------------------- ZSTACK Main END ----------------------
        
        
        
    } //  ----------------------
} // _---------------



struct TablBordNivMat_Previews: PreviewProvider {
    static var previews: some View {
        TablBordNivMat(buttonNumModal2: .constant(0),
                       buttonMatNiv: .constant(0),
                       displayNavMod: .constant(true))
    }
}
