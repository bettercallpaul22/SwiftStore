//
//  FormField.swift
//  SwiftStore
//
//  Created by Obaro Paul on 17/10/2024.
//

import SwiftUI

struct FormField: View {
    @Binding var value:String
    var icon:String
    var placeholder:String
    var isSecure:Bool
    var validateState:ValidateState
    
    var body: some View {
        let borderColor: Color = {
            switch validateState {
            case .valid:
                return .green
            case .invalid:
                return .red
            case .empty:
                return .gray.opacity(0.4)
            }
        }()
        
        HStack{
            Image(systemName: icon)
                .foregroundColor(borderColor)
                .padding(4)
            
            Group{
                if isSecure {
                   SecureField(placeholder, text: $value)
                }else{
                    TextField(placeholder, text: $value)
                        

                }
            }
            .font(Font.system(size: 16, design: .monospaced))
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.leading)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
        }
        .overlay(
        RoundedRectangle(cornerRadius: 8).stroke(Color(borderColor), lineWidth: 2)
//            .shadow(radius: 1, x: 0, y: -5)
        )
//        .padding(4)
    }
}

#Preview {
    @State var fieldValue = "obaroiskool@gmail.com"
    return FormField(value: $fieldValue, icon: "envelope", placeholder: "Enter email", isSecure: false, validateState: .valid)
}
