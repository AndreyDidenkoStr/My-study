//
//  Box.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 27.05.2022.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> ()
    
    var listener: Listener?
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
}
