//
//  Photos.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 27.05.2022.
//

import Foundation

struct Photos {
    var photoName: String

    //делаем массив фотографий из Assets
    static func makePhotosArray() -> [Photos] {
        var photos = [Photos]()
        for index in 1...20 {
            photos.append(Photos(photoName: "photo\(index)"))
        }
        return photos
    }
}
