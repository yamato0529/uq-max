//
//  Array.swift
//  uq-max
//
//  Created by Yamato on 2019/06/10.
//  Copyright © 2019 Kohei Yamato. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    mutating func removeObject(value: Element) {
        if let i = self.index(of: value) {
            self.remove(at: i)
        }
    }
}
