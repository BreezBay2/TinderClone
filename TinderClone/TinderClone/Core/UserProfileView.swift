//
//  UserProfileView.swift
//  TinderClone
//
//  Created by Taro Altrichter on 05.09.24.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentImageIndex = 0
    
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("\(user.age)")
                    .font(.title2)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.pink)
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ZStack(alignment: .top) {
                        Image(user.profileImageURLs[currentImageIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: ScreenDimensions.cardWidth, height: ScreenDimensions.cardHeight)
                            .overlay {
                                ImageTappingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageURLs.count)
                            }
                        
                        ImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageURLs.count)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("About Me")
                        .fontWeight(.semibold)
                    
                    Text("A test bio that says stuff about me")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Essentials")
                        .fontWeight(.semibold)
                        .padding(.vertical, 5)
                    
                    HStack {
                        Image(systemName: "mappin.circle")
                        
                        Text("less than 1km away")
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "suitcase")
                        
                        Text("Actor")
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "ruler")
                        
                        Text("183 cm")
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "heart")
                        
                        Text("heterosexual")
                        
                        Spacer()
                    }
                    
                    
                    
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}

#Preview {
    UserProfileView(user: User.MOCK_USERS[1])
}
