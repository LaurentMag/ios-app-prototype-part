//
//  TableauBord.swift
//  Graine
//
//  Created by laurent on 15/09/2021.
//

import SwiftUI


struct TableauBord: View {    
    
    
    @State var displayModal: Bool = false // bool de show modal
    @State var buttonNum: Int = 3 // valeur initiale bouton mentor apprenant projet,  chque bouton une valeur  !=
    
    
    var body: some View {
        ZStack  {
            Color("turquoise").edgesIgnoringSafeArea(.top)
            VStack {// ---------------------- VSTACK MAIN ----------------------
                
                
                
                VStack {
                    Image(systemName: "doc.on.clipboard")
                        
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                }
                .padding(30)
                Divider().frame(width: 350)
                Divider().frame(width: 350)
                
                
                
                VStack { // ---------------------- VSTACK SECOND ----------------------
                    Group { // ---------------------- GROUP1 ----------------------
                        
                            HStack {
                                Spacer()
                                ImageResisable(imageName: "square.and.arrow.down.on.square.fill", widthIF: 30, heightIF: 30, fontSize: 20, backgColor: "blanc")
                                    .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                                    
//                                square.and.arrow.down.on.square.fill
                                Text("Créer ses Annonces :")
                                    .font(.system(size: 22))
                                    .bold()
                                    .foregroundColor(.white)
                                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                    .padding()
                                
                                Spacer()
                                
                            }.background(Color("turquoise"))


                        Spacer()
                        
                        Divider().frame(width: 350)
                        Divider().frame(width: 350)

                        // --- TEXTE ------------------------------------
                        HStack {
                            Spacer()
                        TextForm1(texte: "Mantorat", fontSize: 18, padding: 1, couleur: .gray)
                            Spacer()
                        }
                        .padding(7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("ardoise").opacity(0.7), lineWidth: 1))
                        .frame(width: UIScreen.main.bounds.width/1.3)


                        // = BOUTON 0 ==================================
                        Button(action: {
                            
                            // toggle variable modale
                            self.displayModal.toggle()
                            buttonNum = 0
                            
                        }, label: {
                            
                            TablBouton(imageTxt: "graduationcap.fill", text2: "", text1Size: 32, text2Size: 23, backgColor: "turquoise2", sizeH: 100, sizeV: 17)
                        })
                        // ---------------------- ON CHANGE RESET BOUTON VALUE ----------------------
                        .onChange(of : self.displayModal) {
                            newProgress  in buttonNum = resetBoutonValue(modalBoolState: displayModal, boutonValue: buttonNum)
                            
                        }
                        // = MODAL ==================================
                        .sheet(isPresented: $displayModal, content: {
                            TableauBordModal(displayModalE: self.$displayModal, buttonNumModal: self.$buttonNum)
                        })
                        // instance de la modal déclaré dans le sheet, avec ces differentes valeurs : buttonNum-> pour pas avoir à déclarer de valeur par defaut. Déclare Modal une seule fois car lié  au boutonNum, et chaque bouton envoie un num
                        .padding(.bottom, 15)
                        
                    } // ---------------------- GROUP1 END ----------------------
                    
                    
                    Group { // ---------------------- GROUP2 ----------------------
                        Divider().frame(width: 350)
                        Divider().frame(width: 350)
                        
                        // --- TEXTE ------------------------------------
                        HStack {
                            Spacer()
                        TextForm1(texte: "Apprenant", fontSize: 18, padding: 2, couleur: .gray)
                            Spacer()
                        }
                        .padding(7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("ardoise").opacity(0.7), lineWidth: 1))
                        .frame(width: UIScreen.main.bounds.width/1.3)

                        // = BOUTON 1 ==================================
                        Button(action: {
                            // toggle variable modale
                            self.displayModal.toggle()
                            buttonNum = 1
                            
                        }, label: {
                            TablBouton(imageTxt: "studentdesk", text2: "", text1Size: 32, text2Size: 23,
                                       backgColor: "turquoise2", sizeH: 100, sizeV: 17)
                        })
                        .padding(.bottom, 20)
                        Spacer()
                        Divider().frame(width: 350)
                        Divider().frame(width: 350)
                        
                        // --- TEXTE ------------------------------------
                        HStack {
                            Spacer()
                        TextForm1(texte: "Définir son Projet", fontSize: 18, padding: 2, couleur: .gray)
                            Spacer()
                        }
                        .padding(7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("ardoise").opacity(0.7), lineWidth: 1))
                        .frame(width: UIScreen.main.bounds.width/1.2)

                        // = BOUTON 2 ==================================
                        Button(action: {
                            // toggle variable modale
                            self.displayModal.toggle()
                            buttonNum = 2
                        }, label: {
                            TablBouton(imageTxt: "gearshape.2.fill", text2: "", text1Size: 32, text2Size: 23,
                                       backgColor: "pourpre2", sizeH: 100, sizeV: 17)
                        })
                        .padding(.bottom, 30)
                    } // ---------------------- GROUP2 END ----------------------
                    Spacer()
                      
                    
                } // ---------------------- VSTACK SECOND ----------------------
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
                
                
            }
        }
    }
    
    
}




struct TableauBord_Previews: PreviewProvider {
    static var previews: some View {
        TableauBord()
    }
}
