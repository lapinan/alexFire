//
//  HomeView.swift
//  alexFire
//
//  Created by Андрей Лапин on 12.04.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var profileEditor: ProfileEditor
    
    var body: some View {
        ScrollView {
            VStack {                
                VStack {
                    if let image = profileEditor.coverImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                            .clipped()
                            .mask(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                    } else {
                        Image("car-header")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                            .clipped()
                            .mask(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                    }
                    
                    Spacer()
                }
                .frame(height: 348)
                .overlay(
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 200, height: 200)
                                
                            if let image = profileEditor.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 172, height: 172)
                            } else {
                                Image("person")
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 172, height: 172)
                            }
                        }

                        VStack(spacing: 6) {
                            Text("John Doe")
                                .bold()
                            Text(profileEditor.bio)
                                .font(.caption2)
                        }
                    }
                    .frame(height: 248)
                    , alignment: .bottom
                )
                .padding(.bottom, 40)
                                
                
                Divider()
                    .padding(.horizontal, 20)
                
                Text("Posts")
                    .bold()
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                
                VStack(spacing: 100) {
                    ForEach(Post.posts()) { post in
                        PostItem(post: post)
                    }
                }
            }
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(profileEditor: ProfileEditor())
    }
}
