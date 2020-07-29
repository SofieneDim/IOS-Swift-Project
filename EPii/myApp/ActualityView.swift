//
//  ActualityView.swift
//  EPii
//
//  Created by Dimessi on 9/29/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

protocol SelectedItem {
    func itemSelected(item: resultsContent)
}

class ActualityView: UIView {
    
    let tableView: UITableView
    let bgImage: UIImageView
    var actualityResults: [resultsContent] = []
    var didEndDisplaying = false
    var scrollDetect = false
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    let spinnerImage = UIImageView(image: UIImage(named: "Layer 0"))
    let bgimage = UIImageView(image: UIImage(named: "Blur bg-1"))
    let backView = UIView()
    let session = SessionExpired(message: "Ssession expirée")
    
    let fakeData: [resultsContent] = [
    resultsContent(id: 1234, title: "Title one", content: "", img: "img11", date: "01-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", img: "img12", date: "02-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", date: "03-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", img: "img3", date: "04-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", img: "img13", date: "05-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", img: "img14", date: "06-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", date: "07-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", img: "img15", date: "08-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", img: "img9", date: "09-01-2019"),
    resultsContent(id: 1234, title: "Title one", content: "", img: "img10", date: "10-01-2019")]

    
    var delegate: SelectedItem?
    var page = 1
    
    init() {

        self.tableView = UITableView(frame: .zero, style: .plain)
        bgImage = UIImageView(image: UIImage(named: "Blur bg-1"))
        
        super.init(frame: .zero)
        
        spinner.transform = CGAffineTransform.init(scaleX: 0.55, y: 0.55)
        spinner.color = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        backView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5010434503)
        
        layoutView()
        
        self.tableView.isHidden = true
        self.tableView.register(ActualityViewCell.self, forCellReuseIdentifier: "atualityCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
       }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sessionExpired(sessionDelegate: SessionExpiredView){
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backView)
        let backTop = backView.topAnchor.constraint(equalTo: topAnchor)
        let backLead = backView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let backTrai = backView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let backBottom = backView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        session.translatesAutoresizingMaskIntoConstraints = false
        addSubview(session)
        let sessioncentreY = session.centerYAnchor.constraint(equalTo: centerYAnchor)
        let sessionHeight = session.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        let sessionTrai = session.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let sessionLead = session.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        
        NSLayoutConstraint.activate([sessioncentreY, sessionHeight, sessionTrai, sessionLead, backTop, backLead, backTrai, backBottom])
        session.delegate = sessionDelegate
    }
    
    func layoutView() {
        
        bgimage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgimage)
        let bgimageTop = bgimage.topAnchor.constraint(equalTo: topAnchor)
        let bgimageLeading = bgimage.leadingAnchor.constraint(equalTo: leadingAnchor)
        let bgimageTrailing = bgimage.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bgimageBottom = bgimage.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        spinnerImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinnerImage)
        let spinnerICentreY = spinnerImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        let spinnerICentreX = spinnerImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        let spinnerIHeight = spinnerImage.heightAnchor.constraint(equalToConstant: 70)
        let spinnerIWidth = spinnerImage.widthAnchor.constraint(equalToConstant: 70)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.contentInset.bottom = 70
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        let spinnerBottom = spinner.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 20)
        let spinnerCenterX = spinner.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        addSubview(tableView)
        let tableViewTop = tableView.topAnchor.constraint(equalTo: topAnchor)
        let tableViewLeading = tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let tableViewTrailing = tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let tableViewBottom = tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        
        NSLayoutConstraint.activate([bgimageTop, bgimageTrailing, bgimageLeading, bgimageBottom,
                                     spinnerICentreX, spinnerICentreY, spinnerIWidth, spinnerIHeight,
                                     tableViewTop, tableViewLeading, tableViewTrailing, tableViewBottom,
                                     spinnerBottom, spinnerCenterX])
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.duration = 0.7
        rotationAnimation.repeatCount = .infinity
        spinnerImage.layer.add(rotationAnimation, forKey: nil)
    }
}

extension ActualityView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actualityResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "atualityCell", for: indexPath) as! ActualityViewCell
        
        cell.title = actualityResults[indexPath.row].title
        cell.content = actualityResults[indexPath.row].content
        if let bgImage = actualityResults[indexPath.row].img{
            cell.bgImage = UIImage(named: bgImage)
        }
        cell.date = actualityResults[indexPath.row].date
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.itemSelected(item: actualityResults[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == actualityResults.count - 3  && didEndDisplaying && !scrollDetect {
            spinner.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.actualityResults += self.fakeData
                self.scrollDetect = true
                tableView.reloadData()
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

        didEndDisplaying = true
        scrollDetect = false
    }
}
