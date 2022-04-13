//
//  ProfileView.swift
//  alexFire
//
//  Created by Андрей Лапин on 12.04.2022.
//

import SwiftUI

struct ProfileView: View {
    @State private var openProfileImagePicker: Bool = false
    @State private var openCoverImagePicker: Bool = false
    
    @StateObject private var stateManager = StateManager()
    @ObservedObject var profileEditor: ProfileEditor
        
    @FocusState private var focusedBio: Bool?
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Text("Profile picture")
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    Button("Edit") {
                        openProfileImagePicker = true
                    }
                    .sheet(isPresented: $openProfileImagePicker, onDismiss: {
                        profileEditor.loadImageFromSelectedImage(&profileEditor.profileImage, type: .profile)
                    }) {
                        ImagePicker(image: $profileEditor.selectedImage)
                    }

                }
                
                if let image = profileEditor.profileImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: stateManager.keyboardShow ? 0 : 150, height: stateManager.keyboardShow ? 0 : 150)
                        .clipShape(Circle())
                } else {
                    Image("person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: stateManager.keyboardShow ? 0 : 150, height: stateManager.keyboardShow ? 0 : 150)
                        .clipShape(Circle())
                }
                 
                Divider()
            }
            
            VStack(spacing: 20) {
                HStack {
                    Text("Cover photo")
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    Button("Edit") {
                        openCoverImagePicker = true
                    }
                    .sheet(isPresented: $openCoverImagePicker, onDismiss: {
                        profileEditor.loadImageFromSelectedImage(&profileEditor.coverImage, type: .cover)
                    }) {
                        ImagePicker(image: $profileEditor.selectedImage)
                    }
                }
                
                if let image = profileEditor.coverImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: stateManager.keyboardShow ? 0 : .infinity, maxHeight: stateManager.keyboardShow ? 0 : 200)
                        .clipped()
                        .cornerRadius(20)
                } else {
                    Image("car-header")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: stateManager.keyboardShow ? 0 : .infinity, maxHeight: stateManager.keyboardShow ? 0 : 200)
                        .clipped()
                        .cornerRadius(20)
                }
                
                Divider()
            }
            
            VStack(spacing: 0) {
                HStack {
                    Text("Bio")
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    Button(profileEditor.textEditBtn) {
                        if focusedBio == nil {
                            focusedBio = true
                        } else {
                            profileEditor.saveButton()
                            focusedBio = nil 
                        }
                    }
                }
                
                TextField("Describe yourself...", text: $profileEditor.bio)
                    .multilineTextAlignment(.center)
                    .focused($focusedBio, equals: true)                    
                
                Divider()
                    .padding(.top, 5)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileEditor: ProfileEditor())
    }
}
