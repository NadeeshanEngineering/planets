//
//  KingfisherImageView.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import SwiftUI
import struct Kingfisher.KFImage

// MARK: Custom image view
@ViewBuilder
func KingFisherImageView(url: String) -> KFImage {
    KFImage(
        URL(string: url),
        options: [
            .transition(.fade(0.35))
        ]
    )
    .onSuccess { result in
        print("Image loaded succesfully")
    }
    .onFailure { error in
        print("Error: \(error.localizedDescription)")
    }
}
