//
//  CurrentUserProfileView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 09.09.24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    let user: User
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        Image(user.profileImageURLs[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .fill(Color(.systemGray6))
                                    .frame(width: 128, height: 128)
                                    .shadow(radius: 10)
                            )
                        
                        Image(systemName: "pencil")
                            .imageScale(.small)
                            .foregroundStyle(.gray)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .frame(width: 32, height: 32)
                                    .shadow(radius: 10)
                            )
                            .offset(x: -8, y: 10)
                    }
                    
                    Text("\(user.fullname), \(user.age)")
                        .font(.title2)
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .onTapGesture {
                    showEditProfile.toggle()
                }
                
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullname)
                    }
                    
                    HStack {
                        Text("E-Mail")
                        
                        Spacer()
                        
                        Text("test@email.com")
                    }
                }
                
                Section("Legal") {
                    Text("Terms of Service")
                }
                
                Section {
                    Button {
                        print("Logout")
                    } label: {
                        Text("Logout")
                    }
                }
                .foregroundStyle(.red)
                
                Section {
                    Button {
                        print("Delete")
                    } label: {
                        Text("Delete Account")
                    }
                }
                .foregroundStyle(.red)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
