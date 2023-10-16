//
//  RegistrationView.swift
//  ToDoList
//
//  Created by tardisomus on 04.10.2023.
//

import SwiftUI

struct RegistrationView: View {

    @StateObject var viewModel = RegistrationVewModel()
    
    var body: some View {
        VStack {
            // header
            HeaderView(
                title: "Register",
                subtitle: "Start organizing todos",
                angle: -15,
                background: .orange
            )
            
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.orange)
                    .rotationEffect(Angle(degrees: -15))
                
                VStack {
                    Text("Register")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text("Start organizing todos")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 30)
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 300)
            .offset(y: -30)
            
            // register form
            Form {
                TextField("Your name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Create password", text: $viewModel.password)
                    .textFieldStyle(PlainTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green) {
                    viewModel.register()
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
