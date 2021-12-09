//
//  TablBordNivMatEnd.swift
//  Graine
//
//  Created by laurent on 21/09/2021.
//

import SwiftUI

struct TablBordNivMatEnd: View {
    
    // Binding bazar ----------------------------------
    @Binding var buttonNumModal4: Int //<-- buttonNumModal3 <-- buttonNumModal2 <-- buttonNumModal <-- buttonNum   ||| // valeur bouton tableau de bord
    @Binding var buttonMatNiv3: Int // valeur bindé bouton matière niveau
    @Binding var displayNavMod3: Bool // bind des boutons mat et niveau
    
    
    var matNivTxtRecu2: String //Valeur liste niveau 2
    
    var testSaveRestaure: String
    var restoreNivS: String {
        return restaureNivSFunc(boutonTBValue: buttonNumModal4, boutonModValue: buttonMatNiv3)
    }
    
    var body: some View {
        
        ZStack {
            VStack {
            ImageResisable(imageName: "book.closed.fill", widthIF: 300, heightIF: 400, fontSize: 30, backgColor: "turquoise2")
                .opacity(0.9)
                .offset(x: -20, y: 0)
                Spacer()
                    .frame(height: 50)
            }
            
            
            VStack(alignment: .leading) { // ---------------------- VSTACK  ----------------------
                
                
                Text("Selectionnné :")
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                Text("\(matNivTxtRecu2)")
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 70)
                
                Button(action: {
                   saveNiv2Func(niv2TxtToSave: matNivTxtRecu2, boutonTBValue: buttonNumModal4, boutonModValue: buttonMatNiv3)
                    displayNavMod3 = false
                    
                    
                    
                }, label: {
                    TablBouton(imageTxt: "", text2: "Valider", text1Size: 0, text2Size: 15, backgColor: "pourpre2", sizeH: 50, sizeV: 14)
                })
                Spacer()
                    .frame(height: 200)
                
                
            }  // ---------------------- VSTACK  ----------------------
            
            
        }
        
        
        
        
    } //----------------
} // ------------------

struct TablBordNivMatEnd_Previews: PreviewProvider {
    static var previews: some View {
        TablBordNivMatEnd(buttonNumModal4: .constant(0),
                          buttonMatNiv3: .constant(0),
                          displayNavMod3: .constant(false),
                          matNivTxtRecu2: "defaultEnd", testSaveRestaure: "truc")
    }
}
