//
//  NavLink.swift
//  SwiftStore
//
//  Created by Obaro Paul on 17/10/2024.
//

import SwiftUI

struct NavLink: View {
    var text:String
    var subText:String
    var body: some View {
        HStack{
            Text(text)
            Text(subText)
                .font(.system(size: 16, weight: .semibold))
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    NavLink(text: "text", subText: "subText")
}
