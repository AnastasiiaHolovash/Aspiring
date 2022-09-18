//
//  CodeGenerator.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-18.
//

import UIKit

enum CodeGenerator {}

extension CodeGenerator {
    static func generateQRCode(from string: String) -> Data? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                let image = UIImage(ciImage: output)
                return UIImage(ciImage: output).pngData()!
            }
        }

        return nil
    }
}
