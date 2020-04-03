//
//  PaymentView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

enum PaymentMethod: Int, CaseIterable {
    case masterCard = 0
    case visa
    case paypal

    var description: String {
        switch self {
        case .masterCard:
            return "MasterCard"
        case .visa:
            return "Visa"
        case .paypal:
            return "Paypal"
        }
    }
}

struct PaymentView: View {
    @State private var selectedMethod: PaymentMethod = .masterCard

    @State private var cardholderName = ""
    @State private var cardNumber = ""
    @State private var expireDate = ""
    @State private var cvv = ""
    @State private var formYOffset: CGFloat = 0
    @State private var isSendingPending = false
    @State private var paymentSent = false

    private let okView = OkView(width: 30, lineWidth: 7)
    private let loadingView = LoadingView(lineWidth: 7)

    var body: some View {
        NavigationView {
            Form {
                createPaymentMethodSection()
                createDetailsSection()
            }
            .navigationBarTitle("Payment", displayMode: self.formYOffset == 0 ? .large : .inline)
            .offset(y: self.formYOffset)
            .blur(radius: self.isSendingPending ? 7 : 0)
            .overlay(
                VStack{
                    if self.isSendingPending {
                        createPopupContent()
                    } else {
                        EmptyView()
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background( self.isSendingPending ? Color.background.opacity(0.3) : .clear).onAppear(perform: {
                        print("Runs")
                    })
            )
        }
    }

    fileprivate func createPaymentMethodSection() -> some View {
        let headerView = Text("Select payment method")
            .font(.system(size: 20, weight: .semibold, design: .default))

        return Section(header: headerView) {
            Picker("", selection: self.$selectedMethod) {
                ForEach(PaymentMethod.allCases, id: \.self) {
                    Text("\($0.description)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.top, .bottom], 10)
        }
    }

    fileprivate func createDetailsSection() -> some View{
        let isPaypal = self.selectedMethod == .paypal
        let headerView = Text("Credit card details")
            .font(.system(size: 20, weight: Font.Weight.semibold))
        let footerView = LCButton(text: "Pay", action: {
            self.simulatePayment()
        })

        return Section(header: headerView, footer: footerView) {
            LCTextField(value: self.$cardholderName,
                        placeholder: isPaypal ? "Username" : "Cardholder Name",
                        leadingIcon: Image(systemName: "person"))

            HStack {
                LCTextField(value: self.$cardNumber,
                            placeholder: isPaypal ? "Password" : "Card Number",
                            leadingIcon: Image(systemName: isPaypal ? "lock" : "number"),
                            isSecure: isPaypal)

                Image(self.selectedMethod.description)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
            }

            if !isPaypal {
                LCTextField(value: self.$expireDate,
                            placeholder: "Expire Date",
                            leadingIcon: Image(systemName:"calendar"))
                LCTextField(value: self.$cvv,
                            placeholder: "CVV",
                            leadingIcon: Image(systemName: "lock"))
            }
        }
    }

    fileprivate func createPopupContent() -> some View {
        return VStack {
            if paymentSent {
                self.okView.transition(.hearbeat)
                Text( "Success!").foregroundColor(.gray).padding()
            } else {
                self.loadingView.frame(width: 50, height: 50).transition(.scale)
                Text( "Validating...").foregroundColor(.gray).padding()
            }
        }.frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
            .padding()
            .background(Color.background.opacity(0.7))
            .cornerRadius(20)
            .shadow(color: Color.textColor.opacity(0.3), radius: 20, x: 0, y: 10)
            .transition(.move(edge: .bottom))
    }

    fileprivate func simulatePayment() {
        if !cardNumber.isEmpty &&
            !expireDate.isEmpty &&
            !cardholderName.isEmpty &&
            !cvv.isEmpty {
            self.isSendingPending = true

            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                withAnimation {
                    self.paymentSent = true
                }
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    withAnimation {
                        self.isSendingPending = false
                    }
                }
            }
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
