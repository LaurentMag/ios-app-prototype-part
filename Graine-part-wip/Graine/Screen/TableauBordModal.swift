//
//  TableauBordModal.swift
//  Graine
//
//  Created by laurent on 16/09/2021.
//

import SwiftUI

struct TableauBordModal: View {
    
    var modalTxtChange: ModalParamStruct {
        getmodalPFunc(boutonValue: buttonNumModal)  // Func changement modal text en fonction bouton
    }
    
    // ---------------------- Changement text / modal version ----------------------
    @Binding var displayModalE: Bool // <-- displayModal ORI ||| Binding Bool Modale est affichée
    @Binding var buttonNumModal: Int  // <-- buttonNum ORI   ||| Binding bouton  mentor, apprenant, projet
    
    // ---------------------- Bouton Modal navView & modal ----------------------
    @State var showModNivMat : Bool = false // Bool pour montrer modal matière ou niveau
    @State var buttonNumNivMat: Int = 2 // valeur boutons matière & niveau
    
    // ---------------------- TEXTE restauration ----------------------
    @State var precisionText: String = "" // text entré dans le textfield
    @State private var isEditing = false
    
    var restoreTxt: String {
        return restaureTxt(boutonValue: buttonNumModal)
    }
    
    @State private var popupAnnonce = false
    
    // ---------------------- Stepper groupe ----------------------
    @State var stepperGroupInt: Int = 2
    
    var stepperTxt : String {
        if stepperGroupInt <= 2 {
            return "Travail en binome"
        } else {
            return "Groupe de \(stepperGroupInt) personnes"
        }
    }
    

    
    var body: some View {
        ZStack  {
            Color("\(buttonNumModal ==  2 ? "pourpre2" : "turquoise2")").edgesIgnoringSafeArea(.top)
            // ternaire pour changer couleur en fonction bouton
            VStack {
                
                Spacer()
                    .frame(height: 30)
                VStack{ // ---------------------- VSTACK Entete ----------------------
                    // ================= BOUTON ON / OFF  =================
                    Button(action: {
                        
                        displayModalE = false
                        
                    }, label: {
                        ZStack {
                            Image(systemName: modalTxtChange.icon)
                                .font(.system(size: 80))
                                .foregroundColor(.white)
                            
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .offset(x: 60, y: -40)
                        }
                    })
                } // ---------------------- VSTACK Entete end ----------------------
                .padding(.bottom, 25)
                Divider().frame(width: 350)
                Divider().frame(width: 350)
                    .padding(.bottom, 25)
                
                
                
                VStack { // ---------------------- VSTACK SECOND ----------------------
                    
                    Group { // ---------------------- GROUP ----------------------
                        
                        Divider().frame(width: 350)
                        Text(modalTxtChange.titreBoutMat)
                            .bold()
                        
                        // = BOUTON Matière ==================================
                        Button(action: {
                            self.showModNivMat.toggle()
                            buttonNumNivMat =  0
                            
                            
                        }, label: {
                            ZStack {
                                
                                TablBouton(imageTxt: "", text2: "", text1Size: 0, text2Size: 0,
                                           backgColor: "ardoise", sizeH: 150, sizeV: 15)
                                Text("Domaine")
                                    .font(.system(size: 23))
                                    .foregroundColor(.white)
                            }
                        })
                        .padding(.bottom, 10)
                        // = MODAL Matière =========================================
                        .sheet(isPresented: $showModNivMat, content: {
                            TablBordNivMat(buttonNumModal2: $buttonNumModal,
                                           buttonMatNiv: $buttonNumNivMat,
                                           displayNavMod: $showModNivMat)
                        })
                        
                        
                        Text(modalTxtChange.titreBoutonNiv)
                            .bold()
                        
                        // = BOUTON Niveau ==================================
                        Button(action: {
                            self.showModNivMat.toggle()
                            buttonNumNivMat = 1
                            
                        }, label: {
                            ZStack {
                                TablBouton(imageTxt: "", text2: "", text1Size: 0, text2Size: 0,
                                           backgColor: "ardoise", sizeH: 150, sizeV: 15)
                                Text("Niveau")
                                    .font(.system(size: 23))
                                    .foregroundColor(.white)
                            }
                        })
                        .padding(.bottom, 10)
                        // = MODAL Niv =========================================
                        
                        
                        // = TEXTEFIELD Stack ==================================
                        HStack {
                            Image(systemName: "\(isEditing ? "rectangle.and.pencil.and.ellipsis" : "square.and.pencil")")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
                                .offset(x: 0, y: -2)
                            // ---------------------- TEXTFIELD ----------------------
                            TextField("Précision...", text: $precisionText) {
                                enEdit in
                                self.isEditing = enEdit
                            } onCommit: {
                                // ---------------------- TEXTE Sauvegarde et Supression ----------------------
                                textSaveFunc(boutonValue: buttonNumModal, textToSave: precisionText)
                                textSaveDelete(boutonValue: buttonNumModal, textACheck: precisionText)
                                
                            }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            //                            .border(Color(UIColor.separator))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: UIScreen.main.bounds.width/2)
                            //                    Text(precisionText)
                            //                        .foregroundColor(isEditing ? .red : .blue)
                            // ---------------------- TEXTFIELD ----------------------
                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("ardoise").opacity(0.7), lineWidth: 1))
                        
                        // ---------------------- TEXTE restauration space ----------------------
                        VStack {
                            ScrollView{
                                Text(restoreTxt)
                                    .font(.system(size: 17))
                                    .lineSpacing(10)
                            }
                            .frame(maxHeight: 80)
                            .frame(width: 300)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("ardoise").opacity(0.7), lineWidth: 1))
                        
                    } // ---------------------- GROUP OFF ----------------------
                    
                    
                    Group { // ---------------------- GROUP2 ----------------------
                        // =================  Stepper =================
                        Stepper(modalTxtChange.stepperGroupTxt, value: $stepperGroupInt, in: 2...10)
                            .padding(.horizontal, 50)
                        Divider().frame(width: 350)
                        Text(stepperTxt)
                            .font(.body)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                        Divider().frame(width: 350)
                            .padding(.horizontal, 50)
                            .padding(.bottom, 25)
                        
                        
                        Button(action: {
                            self.popupAnnonce = true
                            
                        }, label: {
                            TablBouton(imageTxt: "square.and.arrow.up.on.square.fill", text2: "Créer l'Annonce", text1Size: 25, text2Size: 15, backgColor: "pourpre2", sizeH: 75, sizeV: 18)
                        })
                        .alert(isPresented: $popupAnnonce) {
                            Alert(title: Text("Annonce créée"), message: Text("Retrouvez là dans votre profil"), dismissButton: .default(Text("OK")))
                        }
                        
                    } // ---------------------- GROUP2 OFF ----------------------
                }  // ---------------------- VSTACK SECOND END ----------------------
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                
                
            }// ---------------------- VSTACK Main End ----------------------
        } // ---------------------- ZSTACK End ----------------------
        
        
    } // ----------------------
}// ----------------------







struct TableauBordModal_Previews: PreviewProvider {
    static var previews: some View {
        
        TableauBordModal(displayModalE: .constant(true), buttonNumModal: .constant(0))
    }
}
