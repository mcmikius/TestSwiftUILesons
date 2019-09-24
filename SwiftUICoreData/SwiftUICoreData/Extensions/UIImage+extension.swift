//
//  UIImage+extension.swift
//  SwiftUICoreData
//
//  Created by Mykhailo Bondarenko on 24.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    var toJpegCompressedData: Data? {
        return jpegData(compressionQuality: 0.0)
    }
}
