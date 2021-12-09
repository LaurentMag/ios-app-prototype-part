
import SwiftUI

struct Home: View {
    
    var body: some View {
      
        //1 écran contenu
        VStack (spacing: 0){
            
            //H2 la - logo Graine
            HStack (spacing: 0){
                Text("la")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.512, saturation: 0.799, brightness: 0.73))
                    .font(.system(size: 60))
                    .padding(.top, 30.0)
                
                //cercle logo Graine
                ZStack  {
                    Circle()
                        .frame(width: 180)
                        .foregroundColor(Color(hue: 0.512, saturation: 0.78, brightness: 0.739))
                    VStack   (spacing: 0) {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.white)
                            .padding(.trailing, 28.0)
                            .frame(height: 33.0)
                            .font(.system(size: 60))
                        Text("Graine")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.system(size: 60))
                        
                    }
                    //cercle logo Graine fin
                    
                }
                
            }
            //H2 la - logo Graine fin
            HStack   {
                Button(action: {
                    
                    
                }, label: {
                    HStack {
                        Text("Padawan")
                            .foregroundColor(Color(hue: 0.512, saturation: 0.799, brightness: 0.73))
                            .font(.system(size: 20))
                        
                        Image(systemName: "face.smiling")
                            .foregroundColor(Color(hue: 0.512, saturation: 0.799, brightness: 0.73))
                            .font(.system(size: 20))
                    }
                    
                    
                })
                Text("•")
                    .foregroundColor(Color(hue: 0.512, saturation: 0.799, brightness: 0.73))
                    .font(.system(size: 20))
                    .padding(.horizontal, 10.0)
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        Text("Jedi")
                            
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 5.0)
                            .background(Color(hue: 0.512, saturation: 0.799, brightness: 0.73))
                            .cornerRadius(3.0)
                        
                        Image(systemName: "graduationcap.fill")
                            .foregroundColor(Color(hue: 0.512, saturation: 0.799, brightness: 0.73))
                            .font(.system(size: 20))
                    }
                    
                    
                })
                
            }.padding(.bottom, 26.0)
            //H3 2 textes Padawan Jedi
        }
                                }
            
        
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
