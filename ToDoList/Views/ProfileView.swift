//
//  ProfileView.swift
//  ToDoList
//
//  Created by tardisomus on 04.10.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    VStack {
                        Text("Loading profile...")
                            .padding(.bottom, 20)
                        NavigationLink("goto: Login", destination: LoginView())
                            .padding(.bottom, 8)
                        Button("Log out") { viewModel.logOut() }
                            .tint(.red)
                            .padding(.bottom, 8)
                        Button("try to re:launch profile data") { viewModel.fetchUser() }
                    }
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
        
        // info: name, email, member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ").bold()
                Text(user.name)
            }
            .padding(.bottom, 8)
            HStack {
                Text("Email: ").bold()
                Text(user.email)
            }
            .padding(.bottom, 8)
            HStack {
                Text("Member since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(.bottom, 8)
        }
        .padding()
        
        // sign out
//                TLButton(title: "Log out", background: .red) {
        Button("Log out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
