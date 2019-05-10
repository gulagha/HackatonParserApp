//
//  Converter.swift
//  HackoTravel
//
//  Created by Gulagha Gozalov on 2/28/19.
//  Copyright © 2019 Gulagha Gozalov. All rights reserved.
//

import Foundation

struct Converter {
    
    fileprivate func convert(title: String, location: String, about: String, date: String) -> Hackaton {
        let hackaton = Hackaton(title: title, location: location, about: about, date: date)
        return hackaton
    }
    
    func groupIntoArray(titles: [String], locations: [String], abouts:[String], dates: [String]) -> [Hackaton]{
        var hackatons = [Hackaton]()
        for i in 0..<locations.count {
            hackatons.append(convert(title: titles[i], location: locations[i], about: abouts[i], date: dates[i]))
        }
        
        return hackatons
    }
}

extension Converter {
    func stringToDate(_ date: String) -> Date {
        let dateFromatter = DateFormatter()
        dateFromatter.dateFormat = "dd-mm-yyyy"
        guard let date = dateFromatter.date(from: date) else {
            fatalError()
        }
        return date
    }
}
