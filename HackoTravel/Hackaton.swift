//
//  hackaton.swift
//  HackoTravel
//
//  Created by Gulagha Gozalov on 2/27/19.
//  Copyright © 2019 Gulagha Gozalov. All rights reserved.
//

import Foundation

class Hackaton {
    var title: String
    var link: String?
    var location: String
    var about: String?
    var date: String
    
    init(title: String, link: String, location: String, about: String, date: String) {
        self.title = title
        self.link = link
        self.location = location
        self.about = about
        self.date = date
    }
    
    init(title: String, location: String, about: String, date: String) {
        self.title = title
        self.location = location
        self.about = about
        self.date = date
    }
    
    init(title: String, location: String, date: String){
        self.title = title
        self.location = location
        self.date = date
    }
    
    func description() -> String {
        return "\(title) will take place in \(location) at \(date)"
    }
}
