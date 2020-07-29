//
//  AbscencesViewController.swift
//  EPii
//
//  Created by Dimessi on 9/24/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class AbscencesViewController: UIViewController, SessionExpiredView, DatePickerDelegate {
    
    var userId = ""
    var token = ""
    var roleId = ""
    var nPage = 1
    var universityId = 1
    var abscences = AbscencesData()
    
    var abscencesView: AbscencesView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        abscencesView = AbscencesView(frame: UIScreen.main.bounds, delegate: self)
        abscencesView?.abscences = abscences
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filtre"), style: .plain, target: self, action: #selector(showDatePicker))
        
        view = abscencesView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.abscencesView!.startAnimate()
    }
    
    @objc func showDatePicker(){
        abscencesView!.showDatePicker()
    }
    
    func annuler() {
        abscencesView!.datePicker.removeFromSuperview()
    }
    
    func dismissAlert() {
        dismiss(animated: false, completion: nil)
    }
    
    func valider(debutDate: String, finDate: String) {
        
        abscencesView?.showTopLabel(debut: debutDate, fin: finDate)
        abscencesView!.datePicker.removeFromSuperview()
        
        print("Must send a request")
    }
}
