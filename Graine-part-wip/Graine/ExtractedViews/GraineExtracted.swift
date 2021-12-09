//
//  GraineExtracted.swift
//  Graine
//
//  Created by laurent on 15/09/2021.
//

import SwiftUI

struct GraineExtracted: View {
    
    @State private var toggleSBoolCl : Bool = false
    
    @State private var showingAlert = false
    
    
    var body: some View {
        VStack { // ---------------------- MAIN VSTACK ----------------------
            
//            TablBouton(imageTxt: "square.and.arrow.up.on.square.fill", text2: "Valider l'annonce", text1Size: 25, text2Size: 15, backgColor: "pourpre2")
            
            
            Button("Show Alert") {
                       self.showingAlert = true
                   }
                   .alert(isPresented: $showingAlert) {
                       Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
                   }
            
            Group {
            Spacer()
                .frame(height: 100)
            Button(action: {
                
            }, label: {
            TablBouton(imageTxt: "square.and.arrow.up.on.square.fill", text2: "Valider l'annonce", text1Size: 25, text2Size: 15, backgColor: "pourpre2", sizeH: 100, sizeV: 17)
            })
            
                TablBouton(imageTxt: "", text2: "Domaine : cerf volant", text1Size: 0, text2Size: 20, backgColor: "turquoise2", sizeH: 150, sizeV: 15)

            
            ToggleSwitchCl(txtToggleCl: "Activer l'Annonce :", toggleBoolCl: $toggleSBoolCl)
            
                ImageResisable(imageName: "square.and.arrow.up.on.square.fill", widthIF: 40, heightIF: 40, fontSize: 20, backgColor: "pourpre2")
          
            
            }
         
            Button(action: {
                //                self.onTxtValidation.toggle()
            }, label: {
                Image(systemName: "checkmark.rectangle")
                    .resizable()
                    .frame(width: 60, height: 30)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .rotationEffect(Angle(degrees: 0))
                    .offset(x: 0, y: 0)
            })
            
           
            
        }  // ---------------------- MAIN VSTACK ----------------------
    }
}

struct GraineExtracted_Previews: PreviewProvider {
    static var previews: some View {
        GraineExtracted()
    }
}

// .frame(width: UIScreen.main.bounds.width/1.9) // defini une fraction de la taille de l'écran

// ------------------------------------- -------------------------------------
// -------------------------------------DESIGN -------------------------------------
// ------------------------------------- -------------------------------------

// ======================== BOUTON ========================
struct TablBouton: View {
    var imageTxt: String
    var text2: String
    var text1Size: CGFloat
    var text2Size: CGFloat
    var backgColor: String
    var sizeH: CGFloat
    var sizeV: CGFloat
    
    var body: some View {
        // ========================
        ZStack {
            
            // ========================
            HStack {
                Text("")
                    .padding(.horizontal, sizeH)
                    .padding(sizeV)
                    .background(Color(backgColor))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 3, y: 3)
                
            }
            .padding(2)
            // ========================
            HStack(alignment: .center) {
                Image(systemName: imageTxt)
                    .font(.system(size: text1Size))
                    .foregroundColor(.white)
                
                Text(text2)
                    .font(.system(size: text2Size))
                    .foregroundColor(.white)
            }
            
        }
    }
} // ======================== BOUTON FIN ========================



// ======================== Toggle switch ========================
struct ToggleSwitchCl : View {
    
    var txtToggleCl: String
    @Binding var toggleBoolCl: Bool
    
    
    var body: some View {
        HStack {
                Text(txtToggleCl)
                    .foregroundColor(.black)
                    .frame(alignment: .leading)
                Spacer()
                    .frame(width: 80)
                Toggle("filter", isOn: $toggleBoolCl).labelsHidden()
                    .font(.system(size: 15))
                    .padding(.leading, 40)
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 0.5)
                .foregroundColor(.gray)
        )
    }
} // ======================== Toggle FIN ========================


// ======================== image resizable ========================

struct ImageResisable : View {
    
    var imageName: String
    var widthIF: CGFloat = 15
    var heightIF: CGFloat = 15
    var fontSize: CGFloat = 15
    var backgColor: String
    
    var body: some View {
                
        Image(systemName: imageName)
            .resizable()
            .frame(width: widthIF, height: heightIF)
            .shadow(color: .gray, radius: 1, x: 1, y: 1)
            .font(.system(size: fontSize))
            .foregroundColor(Color(backgColor))
            .rotationEffect(Angle(degrees: 0))
            .offset(x: 0, y: 0)
    }
}
// ======================== image resizable FIN ========================

struct TextForm1: View {
    
    var texte: String
    var fontSize: CGFloat
    var padding: CGFloat
    var couleur: Color
    
    
    var body: some View {
        
        
        Text(texte)
            .font(.system(size: fontSize))
            .bold()
            .foregroundColor(couleur)
            .padding(padding)
        
    }
}
