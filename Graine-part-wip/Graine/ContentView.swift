
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            //1 écran contenu appeler écran
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Tab 1")
                }
            
            //2 écran contenu
            Recherche()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Recherche")
                }
            //3 écran contenu
            TableauBord()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Tableau de Bord")
                }
            
            //4 écran message
            Message()
                .tabItem {
                    Image(systemName: "envelope")
                    Text("Messages")
                }
            //5 écran Profil
            Profil()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
