//
//  TBView.swift
//  TableViewFooter
//
//  Created by Dimessi on 10/8/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

struct Expandable {
    var isExpanded: Bool
    var content: [String]
}

class TBView: UIView {
    
    let tableView: UITableView
    var pickerVisible = false
    var content = [Expandable(isExpanded: false, content: ["ttttttt"]),
                   Expandable(isExpanded: false, content: ["hhhhhh"]),
                   Expandable(isExpanded: false, content: ["eeeeee"]),
                   Expandable(isExpanded: false, content: ["aaaaaaa"])]
    
    init() {
        
        tableView = UITableView()
        
        super.init(frame: .zero)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        

        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        let tableViewTop = tableView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let tableViewLeading = tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let tableViewTrailing = tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let tableViewBottom = tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        
        
        NSLayoutConstraint.activate([tableViewTop, tableViewLeading, tableViewTrailing, tableViewBottom])
        
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TBView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return content.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if content[section].isExpanded {
            return 0
        }
        return content[section].content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.backgroundColor = .gray
        cell.textLabel?.text = content[indexPath.section].content[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 34
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Colse", for: .normal)
        button.backgroundColor = .orange
        button.tag = section
        
        button.addTarget(self, action: #selector(handle), for: .touchUpInside)
        return button
    }
    
    @objc func handle(button: UIButton){
        
        let section = button.tag
        let isExpanded = content[section].isExpanded
        
        let indexPath = IndexPath(row: 0, section: section)
        
        button.setTitle(!isExpanded ? "Open" : "Close", for: .normal)
        
        content[section].isExpanded = !isExpanded
        
        if isExpanded {
            tableView.insertRows(at: [indexPath], with: .fade)
        } else {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
