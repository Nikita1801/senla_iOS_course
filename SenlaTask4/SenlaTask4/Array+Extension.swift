//
//  Array+Extension.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 22.04.2022.
//

import UIKit

extension Array where Element: Equatable {
        
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
        }
}

