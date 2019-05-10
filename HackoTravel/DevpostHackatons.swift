//
//  DevpostHackatons.swift
//  HackoTravel
//
//  Created by Gulagha Gozalov on 2/27/19.
//  Copyright © 2019 Gulagha Gozalov. All rights reserved.
//

import Foundation
import SwiftSoup

struct DevpostHackatons {
    var titles = [String]()
    var locations = [String]()
    var dates = [String]()
    var divs = [Element]()
    var abouts = [String]()
    
    /// The variable is located in the end of the urlWithoutIndex.
    var pageIndex: Int = 1
    
    /// This function grabs hackatons from "Devpost", assigns them to the relevant arrays
    /// - Parameter link: link of the source
    /// - Returns: Nothing
    mutating func grabData(from link: String) {
        do {
            while true {
                let urlWithoutIndex = link + "\(pageIndex)"
                
                guard let myURL = URL(string: urlWithoutIndex) else {
                    print("Error: \(urlWithoutIndex) doesn't seem to be a valid URL")
                    return
                }
        
                let html = try String(contentsOf: myURL, encoding: .utf8)
                let doc: Document = try SwiftSoup.parse(html)
                
                //If the page doesn't contain any title of a hackaton, it'll break the while loop
                if try doc.select("h2.title").array().isEmpty { break }
                
                divs += try doc.select("div.content").array()
//                titles += try doc.select("h2.title").array().map{try $0.text()}
//                locations += try doc.select("p.challenge-location").array().map{try $0.text()}
                dates += try doc.select("span.date-range").array().map{try $0.text()}
        
                pageIndex += 1
            }
            
            for i in 0..<divs.count{
                titles += try divs[i].select("h2.title").array().map{try $0.text()}
                abouts += try divs[i].select("p.challenge-description").array().map{try $0.text()}
                var temp = try divs[i].select("p.challenge-location").map{try $0.text()}
                if temp.isEmpty {
                    temp = ["none"]
                }
                locations += temp
                //dates += try divs[i].select("span.date-range").array().map{try $0.text()}
            }
        
        } catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
        } catch {
            print("error")
        }
        //print(divs)
    }
    
}
