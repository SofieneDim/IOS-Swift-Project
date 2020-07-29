//
//  EmploiDetailView.swift
//  EPii
//
//  Created by Dimessi on 9/27/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class EmploiDetailView: UIView {
    
    var index: Int = 0
    var subject: UILabel!
    var teacher: UILabel!
    var comment: UILabel!
    var hallSalle: UILabel!
    var dateLabel: UILabel!
    let hourIcon = UIImageView(image: UIImage(named: "hour"))
    var beginEndTime: UILabel!
    let bottomLine: UIView
    let bottomLine2: UIView
    let backgroundImage = UIImageView(image: UIImage(named: "Blur bg-1")!)

    init(seance: Seancess, day: [String : String], index: Int) {
        
        
        bottomLine = UIView()
        bottomLine.backgroundColor = .black
        
        bottomLine2 = UIView()
        bottomLine2.backgroundColor = .black
        
        super.init(frame: .zero)
        
        self.index = index
        
        
        dateLabel = UILabel(frame: .zero)
        dateLabel.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5086419092)
        
        let dateDayName = getDate(date: day["day"]!, index: index)
        var dayNumber = ""
        
        if Int(day["day"]!)! < 10 {
            dayNumber = "0" + day["day"]!
        } else {
            dayNumber = day["day"]!
        }
        
        let months = ["Janvier", "Février", "Mars", "Avril", "Mai", "juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"]
        
        dateLabel.text = "\(dateDayName) \(dayNumber) \(months[Int(day["month"]!)! - 1]) \(day["year"]!)"
        
        
        dateLabel.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.systemFont(ofSize: 18)
        
        beginEndTime = UILabel()
        beginEndTime = labelView(label: beginEndTime)
        beginEndTime.text = "\(seance.start_time ?? "") - \(seance.end_time ?? "")"
        
        subject = UILabel()
        subject = labelView(label: subject)
        subject.text = seance.subject_name

        teacher = UILabel()
        teacher = labelView(label: teacher)
        teacher.text = "\(seance.first_name ?? "") \(seance.last_name ?? "")"

        hallSalle = UILabel()
        hallSalle = labelView(label: hallSalle)
        hallSalle.text = seance.hall_name

        comment = UILabel()
        comment.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5086419092)
        comment.font = UIFont.systemFont(ofSize: 14)
        comment.numberOfLines = 0
        comment.text = seance.comment
        
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func labelView(label: UILabel) -> UILabel {
        
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    

    func getDate(date: String, index: Int) -> String {
        
        enum DayName: String { case dim, lun, mar, mer, jeu, ven, sam }
        var dayName = ""
        let dim = [0, 7, 14, 21, 28]
        let lun = [1, 8, 15, 22, 29]
        let mar = [2, 9, 16, 23, 30]
        let mer = [3, 10, 17, 24]
        let jeu = [4, 11, 18, 25]
        let ven = [5, 12, 19, 26]
        let sam = [6, 13, 20, 27]
        let week = [dim, lun, mar, mer, jeu, ven, sam]

        for day in week {
            if day.contains(index){
                switch day {
                case dim: dayName = "Dimanche"
                case lun: dayName = "Lundi"
                case mar: dayName = "Mardi"
                case mer: dayName = "Mercredi"
                case jeu: dayName = "Jeudi"
                case ven: dayName = "Vendredi"
                case sam: dayName = "Samedi"
                default: return ""
                }
            }
        }
        return dayName
    }
    
    func layoutView() {
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundImage)
        let backgroundTop = backgroundImage.topAnchor.constraint(equalTo: topAnchor)
        let backgroundTrailing = backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        let backgroundLeading = backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor)
        let backgroundHeight = backgroundImage.heightAnchor.constraint(equalTo: heightAnchor)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)
        let dateTop = dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3)
        let dateTrailing = dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        let dateLeading = dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        let dateHeight = dateLabel.heightAnchor.constraint(equalToConstant: 40)
        
        beginEndTime.translatesAutoresizingMaskIntoConstraints = false
        addSubview(beginEndTime)
        let timeTop = beginEndTime.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 70)
        let timeTrailing = beginEndTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let timeLeading = beginEndTime.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let timeHeight = beginEndTime.heightAnchor.constraint(equalToConstant: 70)
        
        hourIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hourIcon)
        let hourIconTop = hourIcon.topAnchor.constraint(equalTo: beginEndTime.topAnchor, constant: -20)
        let hourIconCX = hourIcon.centerXAnchor.constraint(equalTo: centerXAnchor)
        let hourIconWidth = hourIcon.widthAnchor.constraint(equalToConstant: 40)
        let hourIconHeight = hourIcon.heightAnchor.constraint(equalToConstant: 40)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomLine)
        let lineTop = bottomLine.topAnchor.constraint(equalTo: beginEndTime.bottomAnchor)
        let lineTrailing = bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let lineLeading = bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let lineHeight = bottomLine.heightAnchor.constraint(equalToConstant: 0.5)
        
        subject.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subject)
        let subjectTop = subject.topAnchor.constraint(equalTo: bottomLine.bottomAnchor)
        let subjectTrailing = subject.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let subjectLeading = subject.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let subjectHeight = subject.heightAnchor.constraint(equalToConstant: 40)
        
        teacher.translatesAutoresizingMaskIntoConstraints = false
        addSubview(teacher)
        let teacherTop = teacher.topAnchor.constraint(equalTo: subject.bottomAnchor)
        let teacherTrailing = teacher.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let teacherLeading = teacher.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let teacherHeight = teacher.heightAnchor.constraint(equalToConstant: 40)
        
        hallSalle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hallSalle)
        let salleTop = hallSalle.topAnchor.constraint(equalTo: teacher.bottomAnchor)
        let salleTrailing = hallSalle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let hsalleLeading = hallSalle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let salleHeight = hallSalle.heightAnchor.constraint(equalToConstant: 40)
        
        bottomLine2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomLine2)
        let lineTop2 = bottomLine2.topAnchor.constraint(equalTo: hallSalle.bottomAnchor)
        let lineTrailing2 = bottomLine2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let lineLeading2 = bottomLine2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let lineHeight2 = bottomLine2.heightAnchor.constraint(equalToConstant: 0.5)
        
        comment.translatesAutoresizingMaskIntoConstraints = false
        addSubview(comment)
        let commentTop = comment.topAnchor.constraint(equalTo: bottomLine2.bottomAnchor)
        let commentTrailing = comment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let commentLeading = comment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let commentHeight = comment.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        
        
        NSLayoutConstraint.activate([timeTop, timeLeading, timeTrailing, timeHeight,
                                     dateTop, dateLeading, dateTrailing, dateHeight,
                                     backgroundTop, backgroundLeading, backgroundTrailing, backgroundHeight,
                                     subjectTop, subjectHeight, subjectLeading, subjectTrailing,
                                     salleTop, salleHeight, salleTrailing, hsalleLeading,
                                     teacherTop, teacherHeight, teacherLeading, teacherTrailing,
                                     commentTop, commentHeight, commentLeading, commentTrailing,
                                     lineHeight, lineTop, lineLeading, lineTrailing,
                                     lineHeight2, lineTop2, lineLeading2, lineTrailing2,
                                     hourIconCX, hourIconTop, hourIconWidth, hourIconHeight])
    }
}

