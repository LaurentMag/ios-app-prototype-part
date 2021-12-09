import SwiftUI

struct Mail: View {
    var body: some View {
        VStack  (alignment: .leading){
            Text("Mail")
                .fontWeight(.bold)
                .foregroundColor(Color("turquoise"))
            Divider()
            Text("To:")
            Divider()
            Text("Type your message")
                .padding(.horizontal, 16.0)
                .foregroundColor(Color("ardoise"))
         
            Button(action: {
                
            }, label: {
                HStack (alignment: .lastTextBaseline){
                    
                    Text(" Send ")
                        
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .background(Color("turquoise"))
                        .cornerRadius(3.0)
                        .padding([.top, .leading], 126.0)
                }
             })
        }
        .padding(.horizontal, 16.0)
        
    }
}



struct Mail_Previews: PreviewProvider {
    static var previews: some View {
        Mail()
    }
}

