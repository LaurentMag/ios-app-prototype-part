//
//  TablBordNivMat2.swift
//  Graine
//
//  Created by laurent on 21/09/2021.
//

import SwiftUI

struct TablBordNivMat2: View {
    
    // Binding bazar ----------------------------------
    @Binding var buttonNumModal3: Int //  <-- buttonNumModal2 <-- buttonNumModal <-- buttonNum   ||| valeur bouton tableau de bord mentor & co 
    @Binding var buttonMatNiv2: Int // <-- buttonNumNivMat <-- ButtonMatNiv |||  valeur bindé bouton matière niveau
    @Binding var displayNavMod2: Bool // <-- showModNivMat <-- displayNavMod |||  bind des boutons mat et niveau
    // Binding bazar ----------------------------------
    
    
    var matNivTxtRecu1: String
    
    
    
    var matNivChoixcomp: [String] {
        if matNivTxtRecu1 != "default" {
            saveNiv1Func(niv1TxtToSave: matNivTxtRecu1, boutonTBValue: buttonNumModal3, boutonModValue: buttonMatNiv2)
            return matNivChoixFunc(choixACheck: matNivTxtRecu1)
        } else {
            return [""]
        }
    }
    
    var body: some View {
        
        List(matNivChoixcomp, id: \.self) { secondListItem in
            
            NavigationLink(
                destination: TablBordNivMatEnd(buttonNumModal4: $buttonNumModal3,
                                               buttonMatNiv3: $buttonMatNiv2,
                                               displayNavMod3: $displayNavMod2,
                                               matNivTxtRecu2: secondListItem, testSaveRestaure: ""),
                
                //Text(secondListItem.description.capitalized)
                label: {
                    HStack {
                        Spacer()
                            .frame(width: 25)
                        Text(secondListItem.description.capitalized)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                            .padding(8)
                        Spacer()
                    }
                    .font(.system(size: 22))
                    .background(Color("ardoise"))
                    .cornerRadius(10)
                })
            
        }
        .navigationTitle(matNivTxtRecu1)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TablBordNivMat2_Previews: PreviewProvider {
    static var previews: some View {
        TablBordNivMat2(buttonNumModal3: .constant(0),
                        buttonMatNiv2: .constant(0),
                        displayNavMod2: .constant(false),
                        matNivTxtRecu1: "Supérieur")
    }
}

