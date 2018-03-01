//
//  NewsItem.swift
//  StrechMyHeader
//
//  Created by Yongwoo Huh on 2018-02-28.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

import UIKit


struct NewsItem {
    let category: String
    let headline: String
    
    let categoryColor:[String: UIColor] = ["World": .red, "Americas": .blue, "Europe": .green, "Middle East": .yellow,
                                           "Africa": .orange, "Asia Pacific": .purple]
    
    func setCaegoryColor() -> UIColor{
            return categoryColor[category]!
    }
}

