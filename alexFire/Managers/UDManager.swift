//
//  UDManager.swift
//  alexFire
//
//  Created by Андрей Лапин on 13.04.2022.
//

import Foundation
import UIKit

enum UDKeys: String {
    case profileImage = "profileImageUDKey"
    case coverImage = "coverImageUDKey"
    case bio = "bioUDKey"
}

final class UDManager {
    
    static let shared = UDManager()
    
    init() {
        
    }
    
    var bio: String? {
        get {
            if let bio = UserDefaults.standard.string(forKey: UDKeys.bio.rawValue) {
                return bio
            }
            return nil
        } set {
            guard let bio = newValue else { return }
            UserDefaults.standard.setValue(bio, forKey: UDKeys.bio.rawValue)
        }
    }
        
    var profileImage: UIImage? {
        get {
            if let image = getImage(key: UDKeys.profileImage.rawValue) {
                return image
            } else { return nil }
        } set {
            guard let image = newValue else { return }
            saveImage(image: image, key: UDKeys.profileImage.rawValue)
        }
    }
    
    var coverImage: UIImage? {
        get {
            if let image = getImage(key: UDKeys.coverImage.rawValue) {
                return image
            } else { return nil }
        } set {
            guard let image = newValue else { return }
            saveImage(image: image, key: UDKeys.coverImage.rawValue)
        }
    }
    
    private func saveImage(image: UIImage, key: String) {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        let encoded = try! PropertyListEncoder().encode(data)
        UserDefaults.standard.setValue(encoded, forKey: key)
    }
    
    private func getImage(key: String) -> UIImage? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
        guard let image = UIImage(data: decoded) else { return  nil }
        return image
    }
}
