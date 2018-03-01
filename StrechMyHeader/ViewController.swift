//
//  ViewController.swift
//  StrechMyHeader
//
//  Created by Yongwoo Huh on 2018-02-28.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeaderView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var newsDataSouce:[NewsItem]!
    override var prefersStatusBarHidden: Bool { return true }
    
    let kTableHeaderHeight:CGFloat = 242.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsDataSouce = [NewsItem]()
        
        tableView.tableHeaderView = nil
        tableView.addSubview(tableHeaderView)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 140
        tableHeaderView.frame.size.height = kTableHeaderHeight
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        dateLabel.text = ISO8601DateFormatter().string(from: Date())
        
        setupNews()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        
        if tableView.contentOffset.y < -kTableHeaderHeight
        {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        tableHeaderView.frame = headerRect
    }
    
    func setupNews() {
        newsDataSouce.append(NewsItem(category: "World",
                                      headline: "Climate change protests, divestments meet fossil fuels realities"))
        newsDataSouce.append(NewsItem(category: "Europe",
                                      headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"))
        newsDataSouce.append(NewsItem(category: "Middle East",
                                      headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"))
        newsDataSouce.append(NewsItem(category: "Africa",
                                      headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"))
        newsDataSouce.append(NewsItem(category: "Asia Pacific",
                                      headline: "Despite UN ruling, Japan seeks backing for whale hunting"))
        newsDataSouce.append(NewsItem(category: "Americas",
                                      headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"))
        newsDataSouce.append(NewsItem(category: "World",
                                      headline: "South Africa in $40 billion deal for Russian nuclear reactors"))
        newsDataSouce.append(NewsItem(category: "Europe",
                                      headline: "'One million babies' created by EU student exchanges"))
    }
    
}

//MARK: table view data scource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDataSouce.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let newsItemForCell = newsDataSouce[indexPath.row]
        
        cell.CategoryLabel.text = newsItemForCell.category
        cell.CategoryLabel.textColor = newsItemForCell.setCaegoryColor()
        cell.headlineLabel.text = newsItemForCell.headline
        
        return cell
    }
}

// MARK: - Scroll view delegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        updateHeaderView()
    }
}

