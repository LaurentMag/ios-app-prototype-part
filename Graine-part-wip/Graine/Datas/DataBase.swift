
import Foundation


struct Person: Identifiable {
    var id = UUID()
    var avatar: String
    var name: String
    var city: String
}





// ====================================== TableauBord Modal  ======================================

struct ModalParamStruct: Identifiable {
    var id = UUID()
    var icon: String
    var titreBoutMat: String
    var titreBoutonNiv: String
    var switchTxt: String
    var stepperGroupTxt: String
}

// ------------ TableauBord Modal Func : text / bouton pressé ------------



func getmodalPFunc(boutonValue: Int) -> ModalParamStruct {
    if boutonValue == 0 {
        return ModalParamStruct(icon: "graduationcap.fill", titreBoutMat: "Enseigner en :", titreBoutonNiv: "Niveau possédé :", switchTxt: "Présentiel possible", stepperGroupTxt: "Création de groupe :")
    } else if  boutonValue  == 1 {
        return ModalParamStruct(icon: "studentdesk", titreBoutMat: "Apprendre en :", titreBoutonNiv: "Niveau Possédé :", switchTxt: "Présentiel possible", stepperGroupTxt: "Création de groupe :")
    } else if boutonValue == 2 {
        return ModalParamStruct(icon: "gearshape.2.fill", titreBoutMat: "Projet en :", titreBoutonNiv: "Niveau acquis", switchTxt: "Présentiel possible", stepperGroupTxt: "Création de groupe :")
    } else {
        return ModalParamStruct(icon: "", titreBoutMat: "", titreBoutonNiv: "", switchTxt: "", stepperGroupTxt: "")
    }
}

// ------------ TableauBord Modal FuncS sauvegarde / restaure ------------

func resetBoutonValue(modalBoolState: Bool, boutonValue: Int ) -> Int {
    if modalBoolState == false {
        return 3
    } else {
        return boutonValue
    }
} // Inutile ??

var textSaveArray: [String] = ["", "", ""]

func textSaveFunc(boutonValue: Int, textToSave: String) {
    if boutonValue == 0 {
        textSaveArray[0] = textToSave
    } else if boutonValue == 1 {
        textSaveArray[1] = textToSave
    } else if boutonValue == 2 {
        textSaveArray[2] = textToSave
    }
}

func textSaveDelete(boutonValue: Int, textACheck: String) {
    if boutonValue == 0 && textACheck.isEmpty {
        textSaveArray[0] = " "
    } else if boutonValue == 1 && textACheck.isEmpty {
        textSaveArray[1] = " "
    } else if boutonValue == 2 && textACheck.isEmpty  {
        textSaveArray[2] = " "
    }
}

func restaureTxt(boutonValue: Int) -> String {
    if boutonValue == 0 && !textSaveArray[0].isEmpty {
        return textSaveArray[0]
    } else if boutonValue == 1 && !textSaveArray[1].isEmpty  {
        return textSaveArray[1]
    } else if boutonValue == 2 && !textSaveArray[0].isEmpty  {
        return textSaveArray[2]
    } else {
        return " "
    }
}


// ====================================== MODAL MAT ET NIVEAU  ======================================

struct ModNivMatStruct {
    var id = UUID()
    var iconEntete: String
    var arraySelect: [String]
    var navTitre: String
    
}

func ModNivMatFunc(boutonValue: Int) -> ModNivMatStruct {
    if boutonValue == 0 {
        return ModNivMatStruct(iconEntete: "books.vertical.fill", arraySelect: matBaseArray, navTitre: "Matières")
    } else if boutonValue == 1 {
        return ModNivMatStruct(iconEntete: "chart.bar.doc.horizontal.fill", arraySelect: nivBaseArray, navTitre: "Niveau acquis")
    } else {
        return  ModNivMatStruct(iconEntete: "", arraySelect: [""], navTitre: "")
    }
}


// ------------ Affichage Matière & Niv ------------

var matBaseArray: [String] = ["Scolaire", "Langue", "Sport", "Maison", "Informatique", "Art"]
var matScolArray: [String] = ["Math", "Physique", "Chimie", "Biologie", "Histoire", "Géographie", "Autre, à préciser..."]
var matLangueArray: [String] = ["Français", "Anglais", "Espagnol", "Allemand", "Japonais", "Autre, à préciser..."]
var matSportArray: [String] = ["Course", "Escalade", "Cerf-Volant", "natation","Skateboard", "Autre, à préciser..."]
var matMaisonArray: [String] = ["Jardinage", "Cuisine", "Bricolage", "Autre, à préciser..."]
var matInformaArray: [String] = ["Code", "Design", "Web", "3D", "Autre, à préciser..."]
var matArtArray: [String] = ["Dessin", "Bob Ross", "Musique", "Vidéo", "Ecriture", "Autre, à préciser..."]


var nivBaseArray: [String] = ["Audidacte", "Formation", "Collége", "Lycée", "Supérieur"]
var autodidacteArray: [String] = ["dilettante", "Internet", "Lectures", "Entourage", "Autre, à préciser..."]
var formationArray: [String] = ["Simplon", "OpenClassRoom", "Udemy", "Autre, à préciser..."]
var collegeArray: [String] = ["Brevet"]
var lycéeArray:  [String] =  ["Bac"]
var nivSupArray: [String] = ["Ecole", "IUT", "BTS", "Licence", "Master", "Autre, à préciser..."]


// func pour definir second niveau de recherche en fonction du premier chosi
func matNivChoixFunc(choixACheck: String) -> [String] {
    switch choixACheck {
    case "Scolaire":
        return matScolArray
    case "Langue":
        return matLangueArray
    case "Sport":
        return matSportArray
    case "Maison":
        return matMaisonArray
    case "Informatique":
        return matInformaArray
    case "Art":
        return matArtArray
    case "Audidacte":
        return autodidacteArray
    case "Formation":
        return formationArray
    case "Collége":
        return collegeArray
    case "Lycée":
        return lycéeArray
    default:
        return nivSupArray
    }
}

//  ------------ Sauvegarde Mat et Niv   ------------

var saveNiv1Array: [String] = ["", "", "", "", "", ""]

var saveNiv2Array: [String] = ["", "", "", "", "", ""]

// boutonTBValue: 0 = Mentor,  1 = Apprennant, 2 = Projet
// boutonModValue: 0 = Matière , 1 = Niveau d'étude
// Array : Niv1 : premier layer de choix Niv2 le second
// Array : case 2 par 2 :
//  0 & 1 = Matière & Niveau quand Mentor
//  2 & 3 = Matière & Niveau quand Apprenant
//  4 & 5 = Matière & Niveau quand Projet


//  ------------ Save & Restaure Func  ------------

func saveNiv1Func(niv1TxtToSave: String, boutonTBValue: Int, boutonModValue: Int) {
    if boutonTBValue == 0 && boutonModValue == 0 {
        saveNiv1Array[0] = niv1TxtToSave  }
    if boutonTBValue == 0 && boutonModValue == 1 {
        saveNiv1Array[1] = niv1TxtToSave }
    
    else if boutonTBValue == 1 && boutonModValue == 0  {
        saveNiv1Array[2] = niv1TxtToSave }
    if boutonTBValue == 1 && boutonModValue == 1 {
        saveNiv1Array[3] = niv1TxtToSave }
    
    else if boutonTBValue == 2 && boutonModValue == 0  {
        saveNiv1Array[4] = niv1TxtToSave }
    if boutonTBValue == 2 && boutonModValue == 1 {
        saveNiv1Array[5] = niv1TxtToSave }
}

func saveNiv2Func(niv2TxtToSave: String, boutonTBValue: Int, boutonModValue: Int) {
    if boutonTBValue == 0 && boutonModValue == 0 {
        saveNiv2Array[0] = niv2TxtToSave }
    if boutonTBValue == 0 && boutonModValue == 1 {
        saveNiv2Array[1] = niv2TxtToSave }
    
    else if boutonTBValue == 1 && boutonModValue == 0  {
        saveNiv2Array[2] = niv2TxtToSave }
    if boutonTBValue == 1 && boutonModValue == 1 {
        saveNiv2Array[3] = niv2TxtToSave }
    
    else if boutonTBValue == 2 && boutonModValue == 0  {
        saveNiv2Array[4] = niv2TxtToSave }
    if boutonTBValue == 2 && boutonModValue == 1 {
        saveNiv2Array[5] = niv2TxtToSave }
}

func restaureNivSFunc (boutonTBValue: Int, boutonModValue: Int) -> String {
    if boutonTBValue == 0 && boutonModValue == 0 && !saveNiv2Array.isEmpty {
        return "\(saveNiv1Array[0]) : \(saveNiv2Array[0])" }
    else if boutonTBValue == 0 && boutonModValue == 1 && !saveNiv2Array.isEmpty {
        return "\(saveNiv1Array[1]) : \(saveNiv2Array[1])" }
    
    if boutonTBValue == 1 && boutonModValue == 0 && !saveNiv2Array.isEmpty {
        return "\(saveNiv1Array[2]) : \(saveNiv2Array[2])" }
    else if boutonTBValue == 1 && boutonModValue == 1 && !saveNiv2Array.isEmpty {
        return "\(saveNiv1Array[3]) : \(saveNiv2Array[3])" }
    
    if boutonTBValue == 2 && boutonModValue == 0 && !saveNiv2Array.isEmpty {
        return "\(saveNiv1Array[4]) : \(saveNiv2Array[4])" }
    else if boutonTBValue == 2 && boutonModValue == 1 && !saveNiv2Array.isEmpty {
        return "\(saveNiv1Array[5]) : \(saveNiv2Array[5])" }
    
    else {
        return ""
    }
}


func restaureDomBut () -> String {
    if !saveNiv1Array[0].isEmpty {
        return "\(saveNiv1Array[0]) : \(saveNiv2Array[0])"
    } else if !saveNiv1Array[2].isEmpty {
        return "\(saveNiv1Array[2]) : \(saveNiv2Array[2])"
    } else if !saveNiv1Array[4].isEmpty {
        return "\(saveNiv1Array[4]) : \(saveNiv2Array[4])"
    } else {
        return "Domaine"
    }
}

func restaureNivBut () -> String {
    if !saveNiv1Array[1].isEmpty {
        return "\(saveNiv1Array[1]) : \(saveNiv2Array[1])"
    } else if !saveNiv1Array[3].isEmpty {
        return "\(saveNiv1Array[3]) : \(saveNiv2Array[3])"
    } else if !saveNiv1Array[5].isEmpty {
        return "\(saveNiv1Array[5]) : \(saveNiv2Array[5])"
    } else {
        return "Niveau"
    }
}


    
    
    

// ====================================== Stepper  ======================================

var stepperValueArray: [Int] = [0, 0, 0]

//  ------------ Save Func  ------------

func saveStepperValue(boutonTBValue: Int, stepperValue: Int) {
    if boutonTBValue == 0  && stepperValue >= 2 {
        stepperValueArray[0] = stepperValue }
    else if boutonTBValue == 1  && stepperValue >= 2 {
        stepperValueArray[1] = stepperValue }
    else if boutonTBValue == 2  && stepperValue >= 2 {
        stepperValueArray[2] = stepperValue }
}





