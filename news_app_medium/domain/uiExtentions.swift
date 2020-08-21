//
//  uiExtentions.swift
//  news_app_medium
//
//  Created by Qenawi on 8/21/20.
//  Copyright © 2020 Qenawi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(fileURLWithPath: url)) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
