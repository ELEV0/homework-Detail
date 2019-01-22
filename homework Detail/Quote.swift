//
//  Quote.swift
//  homework Detail
//
//  Created by Admin on 22.01.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct Quote {
    var text: String
    var author: String
}


class Singleton {
    static var shared = Singleton()
    
    var quotes: [Quote]?
    
//    private init() {}
}
