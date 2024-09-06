//
//  UserInfoView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 01.09.24.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var showProfileModal: Bool
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullname)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("\(user.age)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    showProfileModal.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            
            Text("Test Bio")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(10)
    }
}

#Preview {
    UserInfoView(showProfileModal: .constant(false), user: User.MOCK_USERS[0])
}
