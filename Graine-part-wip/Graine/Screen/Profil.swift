
import SwiftUI

struct Profil: View {
    
    var body: some View {
      
            VStack (spacing: 0){
     
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 100))
                    VStack (spacing: 0){
                        Text("Maître")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                        Text("Yoda")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                        Text("Math")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        Text("Anglais")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                    }
                    
                    
                }
            
           
        }
    } }

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil()
    }
}
