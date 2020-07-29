//
//  NotesView.swift
//  EPii
//
//  Created by Dimessi on 10/1/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

protocol Notes {
    func itemSelected(item: ResultsContent)
}

class NotesView: UIView {

    let spinnerImage = UIImageView(image: UIImage(named: "Layer 0"))
    let bgimage = UIImageView(image: UIImage(named: "Blur bg-1"))
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    let tableView: UITableView
    
    var content = [ResultsContent]()
    
    let alertView = NetworkAlertView()
    let backView = UIView()
    let session = SessionExpired(message: "Ssession expirée")
    var delegate: Notes?
    var didEndDisplaying = false
    var scrollDetect = false
    
    init(){
        
        self.tableView = UITableView(frame: .zero, style: .plain)
        
        super.init(frame: .zero)
        
        spinner.transform = CGAffineTransform.init(scaleX: 0.55, y: 0.55)
        spinner.color = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        
        backView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5010434503)
        
        setupView()
        tableView.isHidden = true
        tableView.register(NotesViewCell.self, forCellReuseIdentifier: "NotesCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset.bottom = 50
        tableView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
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
    
    func showNetworkError(delegate: NetworkFail){
        
        alertView.delegate = delegate
        alertView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(alertView)
        let alerCentreY = alertView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let alertHeight = alertView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        let alertLeading = alertView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let alertTrailing = alertView.trailingAnchor.constraint(equalTo: trailingAnchor)
        NSLayoutConstraint.activate([alertTrailing, alertLeading, alertHeight, alerCentreY])
    }
    
    func setupView(){
        
        bgimage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgimage)
        let bgimageTop = bgimage.topAnchor.constraint(equalTo: topAnchor)
        let bgimageLeading = bgimage.leadingAnchor.constraint(equalTo: leadingAnchor)
        let bgimageTrailing = bgimage.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bgimageBottom = bgimage.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        spinnerImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinnerImage)
        let spinnerCentreY = spinnerImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        let spinnerCentreX = spinnerImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        let spinnerHeight = spinnerImage.heightAnchor.constraint(equalToConstant: 70)
        let spinnerWidth = spinnerImage.widthAnchor.constraint(equalToConstant: 70)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        let spinnerBottom = spinner.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 40)
        let spinnerCenterX = spinner.centerXAnchor.constraint(equalTo: centerXAnchor)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        let tableViewTop = tableView.topAnchor.constraint(equalTo: topAnchor)
        let tableViewLeading = tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let tableViewTrailing = tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let tableViewHeight = tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        
        NSLayoutConstraint.activate([bgimageTop, bgimageTrailing, bgimageLeading, bgimageBottom,
                                     spinnerCentreX, spinnerCentreY, spinnerWidth, spinnerHeight, spinnerBottom, spinnerCenterX,
                                     tableViewTop, tableViewLeading, tableViewTrailing, tableViewHeight])
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.duration = 0.7
        rotationAnimation.repeatCount = .infinity
        spinnerImage.layer.add(rotationAnimation, forKey: nil)
    }
}

extension NotesView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = content[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NotesViewCell
        cell.backgroundColor = .white
        cell.title = item.title
        cell.content = item.content
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.itemSelected(item: content[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row >= content.count - 1 && didEndDisplaying && scrollDetect{
            spinner.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.content += self.content
                self.didEndDisplaying = false
                self.scrollDetect = false
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        didEndDisplaying = true
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollDetect = true
    }
}
