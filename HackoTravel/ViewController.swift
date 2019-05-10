//
//  ViewController.swift
//  HackoTravel
//
//  Created by Gulagha Gozalov on 2/25/19.
//  Copyright © 2019 Gulagha Gozalov. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var hackatons = [Hackaton]()
    
    var isPageEmpty = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hackatons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        cell.title.text = hackatons[indexPath.row].title
        cell.about.text = hackatons[indexPath.row].about
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var devpostHackatons = DevpostHackatons()
        devpostHackatons.grabData(from: "https://devpost.com/hackathons?ssearch=&challenge_type=in-person&sort_by=Submission+Deadline&page=")
        
        let converter = Converter()
        hackatons = converter.groupIntoArray(titles: devpostHackatons.titles, locations: devpostHackatons.locations, abouts: devpostHackatons.abouts, dates: devpostHackatons.dates)
        
        //print(hackatons[0].description())
        print(devpostHackatons.titles.count)
        print(devpostHackatons.locations.count)
        print(devpostHackatons.dates.count)
        

    }
}

