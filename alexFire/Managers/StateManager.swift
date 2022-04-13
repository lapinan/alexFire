//
//  StateManager.swift
//  alexFire
//
//  Created by Андрей Лапин on 12.04.2022.
//

import SwiftUI

final class StateManager: ObservableObject {
    @Published private(set) var keyboardShow: Bool = false
    
    
    init() {
        addObserversForCheckKeyboard()
    }
    
    private func addObserversForCheckKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillAppear() {
        withAnimation(.default) {
            keyboardShow = true
        }
    }
    
    @objc private func keyboardWillDisappear() {
        withAnimation(.default) {
            keyboardShow = false
        }
    }
}
