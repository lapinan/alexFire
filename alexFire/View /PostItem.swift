//
//  PostItem.swift
//  alexFire
//
//  Created by Андрей Лапин on 12.04.2022.
//

import SwiftUI

struct PostItem: View {
    let post: Post
    
    var body: some View {
        VStack(spacing: 18) {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    if let image = UDManager.shared.profileImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } else {
                        Image("person")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                    Text("John Doe")
                        .font(.caption)
                        .bold()
                        .padding(.top, 5)
                }
                
                Text(post.description)
                    .font(.callout)
            }
            .padding(.horizontal, 20)
            
            Image("post_image")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 235)
                .clipped()
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        PostItem(post: Post.posts()[0])
    }
}
