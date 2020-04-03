//
//  LCTextField.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct LCTextField: View {
    @Binding var value: String
    var placeholder = "Placeholder"
    var leadingIcon = Image(systemName: "person.crop.circle")
    var isSecure = false
    var onEditingChanged: ((Bool) -> Void) = {_ in }

    var body: some View {
        HStack {
            self.leadingIcon
                .imageScale(.large)
                .padding(.vertical)
                .foregroundColor(Color.gray)

            if self.isSecure {
                SecureField(self.placeholder, text: self.$value, onCommit: {
                    self.onEditingChanged(false)
                }).padding(.vertical)
            } else {
                TextField(self.placeholder, text: self.$value, onEditingChanged: { flag in
                    self.onEditingChanged(flag)
                }).padding(.vertical)
            }
        }
    }
}

struct LCTextField_Previews: PreviewProvider {
    static var previews: some View {
        LCTextField(value: .constant(""))
    }
}
