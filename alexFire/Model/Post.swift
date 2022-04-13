//
//  Post.swift
//  alexFire
//
//  Created by Андрей Лапин on 12.04.2022.
//

import SwiftUI

struct Post: Identifiable {
    var id: String = UUID().uuidString
    var nameAuthor: String
    var description: String
    var postImage: String
    
    static func posts() -> [Post] {
        [
            Post(nameAuthor: "John Doe", description: "If you're looking for a cute dessert for a party or even just a little pick-me up, try making some of @bakedbyjosie's bite sized cheesecakes! For more delicious baked goods, watch Baked by Josie", postImage: "post_image"),
            Post(nameAuthor: "John Doe", description: "If you're looking for a cute dessert for a party or even just a little pick-me up, try making some of @bakedbyjosie's bite sized cheesecakes! For more delicious baked goods, watch Baked by Josie", postImage: "post_image")
        ]
    }
}
