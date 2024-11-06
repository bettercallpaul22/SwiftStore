//
//  OtpField.swift
//  SwiftStore
//
//  Created by Obaro Paul on 26/10/2024.
//

import SwiftUI

struct OtpField: View {
    @ObservedObject var viewModel: OTPViewModel
    @FocusState private var fieldFocus: Int?
    @State private var oldValue = ""
    
    var body: some View {
        HStack {
            ForEach(0..<viewModel.enteredValue.count, id: \.self) { index in
                TextField("", text: $viewModel.enteredValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = viewModel.enteredValue[index]
                    }
                })
                .frame(width: 48, height: 48)
                .background(Color(.gray)).opacity(0.4)
                .cornerRadius(5)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .focused($fieldFocus, equals: index)
                .tag(index)
                .background(Color.gray.opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(fieldFocus == index ? Color.green : Color.gray, lineWidth: 2)
                )
                .onChange(of: viewModel.enteredValue[index]) { oldValue, newValue in
                    if viewModel.enteredValue[index].count > 1 {
                        let currentValue = Array(viewModel.enteredValue[index])
                        if currentValue[0] == Character(oldValue) {
                            viewModel.enteredValue[index] = String(viewModel.enteredValue[index].suffix(1))
                        } else {
                            viewModel.enteredValue[index] = String(viewModel.enteredValue[index].prefix(1))
                        }
                    }
                    if !newValue.isEmpty {
                        if index == viewModel.enteredValue.count - 1 {
                            fieldFocus = nil
                        } else {
                            fieldFocus = (fieldFocus ?? 0) + 1
                        }
                    } else {
                        fieldFocus = (fieldFocus ?? 0) - 1
                    }
                }
            }
        }
    }
}

//#Preview {
//    OtpField(viewModel: OTPViewModel(numberOfFields: 6))  // Preview with six fields for OTP entry
//}
