
import SwiftUI

struct ExtractedDesign: View {
    var body: some View {
        VStack {
            TitreRow(texte: "Titre")
            SousTitreRow(texte: "Sous titre")
            TexteRow(texte: "Texte Body")
            BoutonRow(texte: "Bouton")
            AvatarGrandRow(avatar: "avataryoda")
            AvatarPetitRow(avatar: "avataryoda")
            ListeAvatarRow()
    //picto n'apparaît pas ??????????
            SymbolPetitRow(symbol: "leaf")
            Image(systemName: "leaf")
                .font(.system(size: 30))
                .foregroundColor(Color("turquoise"))
        }
        .padding(10.0)
    }
}

struct ExtractedDesign_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedDesign()
    }
}




struct TitreRow: View {
    var texte: String
    var body: some View {
        Text(texte)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color("turquoise"))
    }
}
struct SousTitreRow: View {
    var texte: String
    var body: some View {
        Text(texte)
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}
struct TexteRow: View {
    var texte: String
    var body: some View {
        Text(texte)
            .font(.body)
            .foregroundColor(Color.black)
    }
}
struct PictoRow: View {
    var picto: String
    var body: some View {
        Image(picto)
            .font(.system(size: 40))
            .foregroundColor(Color("turquoise"))
    }
}
struct AvatarGrandRow: View {
    var avatar: String
    var body: some View {
        Image(avatar)
            .resizable()
            .frame(width: 100.0, height: 100.0)
            .cornerRadius(50.0)
    }
}
struct AvatarPetitRow: View {
    var avatar: String
    var body: some View {
        Image(avatar)
            .resizable()
            .frame(width: 40.0, height: 40.0)
            .cornerRadius(20.0)
    }
}
struct SymbolPetitRow: View {
    var symbol: String
    var body: some View {
        Image(symbol)
            .font(.system(size: 30))
            .foregroundColor(Color.green)

    }
}


struct BoutonRow: View {
    var texte: String
    var body: some View {
        Text(texte)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(.horizontal, 10.0)
            .background(Color("turquoise"))
            .cornerRadius(10.0)
            .padding(.all, 5.0)

    }
}
//---------------------réserve ci dessous ne pas utiliser pour le moment
struct AvatarRow: View {
    var image: String
    var larg: CGFloat
    var long: CGFloat
    var corner: CGFloat
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: larg, height: long)
            .cornerRadius(corner)
    }
}
struct ListeAvatarRow: View {
    var body: some View {
        HStack (alignment: .center){
            AvatarRow(image: "avatararya", larg: 50, long: 50, corner: 25)
            VStack (alignment: .leading) {
                TitreRow(texte: "Titre")
                Text("Sous titre")
                    .foregroundColor(.gray)
                Text("Texte")
            }
        }
    }
}





