//
//  ImageService.swift
//  MemoTCA1.9
//
//  Created by phang on 3/22/24.
//

import SwiftUI
import SwiftData
import PhotosUI

import ComposableArchitecture

// MARK: - PhotosPicker 에서 PhotosPickerItem -> UIImage 변환
struct ImageService {
    var convertPhotoToUIImage: ([PhotosPickerItem]) async throws -> [UIImage]
    var convertUIImageToData: ([UIImage]) -> [Data]
    var convertDataToUIImage: ([Data]) -> [UIImage]
    
    enum ImageServiceError: Error {
        case convertError
    }
}

extension ImageService: DependencyKey {
    static let liveValue = Self(
        convertPhotoToUIImage: { photos in
            var result = [UIImage]()
            for photo in photos {
                if let data = try? await photo.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        result.append(uiImage)
                    }
                }
            }
            return result
        },
        convertUIImageToData: { images in
            var result = [Data]()
            for image in images {
                if let data = image.jpegData(compressionQuality: 0.2) {
                    result.append(data)
                }
            }
            return result
        },
        convertDataToUIImage: { datum in
            var result = [UIImage]()
            for data in datum {
                if let uiImage = UIImage(data: data) {
                    result.append(uiImage)
                }
            }
            return result
        }
    )
}
