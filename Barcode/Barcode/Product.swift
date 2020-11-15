//
//  Product.swift
//  Barcode
//
//  Created by Laura Soto on 10/25/20.
//

import Foundation

struct Product {
    let name: String?

    init(data: [String: AnyObject]) {
        if let name = data["name"] as? String {
            self.name = name
        } else { self.name = nil }
    }
}
