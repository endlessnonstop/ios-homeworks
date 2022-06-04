//
//  PostModel.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 25.05.2022.
//

import Foundation

//структура с данными для поста

struct Post {
    var author: String //автор
    var description: String //текст публикации
    var image: String //имя картинки из каталога Assets.xassets
    var likes: Int //количество лайков
    var views: Int //количество просмотров

    //создание массива постов
    static func makePostArray() -> [Post] {
        var post = [Post]()
        for _ in 0...1 {
            post.append(Post(author: "Evgenii Zhuravlev", description: "Wedding biker :)", image: "image1", likes: 0, views: 1))
            post.append(Post(author: "Evgenii Zhuravlev", description: "Description1: Two description, this is second description of all descriptions", image: "image2", likes: 2, views: 3))
            post.append(Post(author: "User3", description: "Description1: Three description, this is the third description of all descriptions", image: "image3", likes: 4, views: 5))
            post.append(Post(author: "User4", description: "Description1: Four description, this is fourth description of all descriptions", image: "image4", likes: 6, views: 7))
        }

        return post
    }

}
