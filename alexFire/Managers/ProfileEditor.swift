//
//  ProfileEditor.swift
//  alexFire
//
//  Created by Андрей Лапин on 12.04.2022.
//

import SwiftUI

final class ProfileEditor: ObservableObject {
    
    @Published var textEditBtn = "Edit"
    
    @Published var profileImage: Image?
    @Published var coverImage: Image?
    @Published var selectedImage: UIImage?
    @Published var bio: String = "" {
        didSet {
            textEditBtn = "Save"
        }
    }
    
    init() {
        loadFullInfo()
    }
    
    func loadImageFromSelectedImage(_ image: inout Image?, type: ImagesType) {
        guard let uiimage = selectedImage else { return }
        image = Image(uiImage: uiimage)
        switch type {
        case .cover:
            UDManager.shared.coverImage = uiimage
        case .profile:
            UDManager.shared.profileImage = uiimage
        }
    }
    
    func saveButton() {
        if !bio.isEmpty {
            UDManager.shared.bio = bio
            textEditBtn = "Edit"
        }
    }
    
    private func loadFullInfo() {
        if let profileUIImage = UDManager.shared.profileImage {
            profileImage = Image(uiImage: profileUIImage)
        }
        if let coverUIImage = UDManager.shared.coverImage {
            coverImage = Image(uiImage: coverUIImage)
        }
        if let bioString = UDManager.shared.bio {
            bio = bioString
            textEditBtn = "Edit"
        }
    }
}

extension ProfileEditor {
    enum ImagesType {
        case profile, cover
    }
}
