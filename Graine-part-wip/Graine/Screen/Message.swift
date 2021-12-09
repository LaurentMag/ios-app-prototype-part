//
//  Message.swift
//  Graine
//
//  Created by laurent on 16/09/2021.
//

import SwiftUI

struct Message: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .border(Color.gray)
            .position(x: 175, y: 100)

    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
