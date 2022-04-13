//
//  ContentView.swift
//  alexFire
//
//  Created by Андрей Лапин on 12.04.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var profileEditor = ProfileEditor()
    
    var body: some View {
        TabView {
            HomeView(profileEditor: profileEditor)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            ProfileView(profileEditor: profileEditor)
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Person")
                    }
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
