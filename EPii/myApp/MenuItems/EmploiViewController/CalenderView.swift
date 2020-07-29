//
//  CalenderView.swift
//  EPii
//
//  Created by Dimessi on 9/26/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

protocol SeanceClicked {
    func itemClicked(seance: Seancess, day: [String : String], index: Int)
}

protocol MonthChanged {
    func resendRequest(month: Int, year: Int)
}

class CalenderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MonthViewDelegate {
    
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var currentMonthIndexS: String = ""
    var currentDayS: String = ""
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   
    
    var contents: [EmploiContent] = []
    var seances: [Seancess] = []
    var seance: Seancess?
    var MonthDelegate: MonthChanged?
    var days: [String] = []
    var myDay: String = ""
    var cellChecked: [Int] = []
    
    let delegate: SeanceClicked
    
    init(content: [EmploiContent], delegate: SeanceClicked, MonthDelegate: MonthChanged) {
        
        self.delegate = delegate
        self.MonthDelegate = MonthDelegate
        
        super.init(frame: .zero)
        
        self.contents = content
        appendData()
        initializeView()
    }
    
    func appendData(){
        days = ["2019-10-15", "2019-10-17", "2019-11-02", "2019-11-03", "2019-09-4", "2019-09-29"]
        seances = [Seancess(subject_name: "Tech", hall_name:"salle 1", first_name: "Hassen", last_name: "Chawki", start_time: "08:30", end_time: "10:00")]
    }
    
    func initializeView() {
        
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth = getFirstWeekDay()
        
        if currentMonthIndex == 2 && currentYear % 4 == 0 {
            numOfDaysInMonth[currentMonthIndex-1] = 29
        }
        
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
        
        setupViews()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(dateCVCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfDaysInMonth[currentMonthIndex-1] + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! dateCVCell
        
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
        } else {
            cell.isHidden = false
            
            let calcDate = indexPath.row - firstWeekDayOfMonth + 2
            cell.lbl.text = "\(calcDate)"
            
            if currentMonthIndex < 10 {
                currentMonthIndexS = "0" + String(currentMonthIndex)
            } else {
                currentMonthIndexS = String(currentMonthIndex)
            }
            
            if calcDate < 10 {
                currentDayS = "0" + String(calcDate)
            } else {
                currentDayS = String(calcDate)
            }
            
            myDay = "\(currentYear)-\(currentMonthIndexS)-\(currentDayS)"

            cell.backgroundColor = #colorLiteral(red: 0.9449954033, green: 0.9451572299, blue: 0.9449852109, alpha: 1)
            cell.lbl.textColor = .black
            for day in days {
                if myDay == day {
                    cell.backgroundColor = #colorLiteral(red: 0.2848940492, green: 0.3291379809, blue: 0.3542536795, alpha: 1)
                    cell.lbl.textColor = .white
                    cellChecked.append(indexPath.row)
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        for index in cellChecked {
            
            if indexPath.row == index {
                //let indexOf = cellChecked.firstIndex(of: indexPath.row)
                let daySelected = indexPath.row - firstWeekDayOfMonth + 2
                seance = seances[0]
                let date = ["year": String(self.currentYear), "month": String(self.currentMonthIndex), "day": String(daySelected)]
                delegate.itemClicked(seance: seance!, day: date, index: indexPath.row)
                
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7
        let height = collectionView.frame.height / 5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex)-01".date?.firstDayOfTheMonth.weekday)!
        
        return day
    }
    
    func didChangeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex = monthIndex + 1
        currentYear = year
        cellChecked = []
        MonthDelegate?.resendRequest(month: currentMonthIndex, year: currentYear)
        
        if monthIndex == 1 {
            if currentYear % 4 == 0 {
                numOfDaysInMonth[monthIndex] = 29
            } else {
                numOfDaysInMonth[monthIndex] = 28
            }
        }
        firstWeekDayOfMonth = getFirstWeekDay()
        myCollectionView.reloadData()
    }
    
    func setupViews() {
        addSubview(monthView)
        monthView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        monthView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        monthView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        monthView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        monthView.delegate = self
        
        addSubview(weekdaysView)
        weekdaysView.topAnchor.constraint(equalTo: monthView.bottomAnchor).isActive = true
        weekdaysView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        weekdaysView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        weekdaysView.heightAnchor.constraint(equalToConstant: 30).isActive=true
        
        addSubview(myCollectionView)
        myCollectionView.topAnchor.constraint(equalTo: weekdaysView.bottomAnchor, constant: 0).isActive=true
        myCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive=true
        myCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive=true
        myCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    let monthView: MonthView = {
        let v = MonthView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let weekdaysView: WeekdaysView = {
        let v=WeekdaysView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let myCollectionView=UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.backgroundColor = UIColor.clear
        myCollectionView.allowsMultipleSelection = false
        return myCollectionView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class dateCVCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.borderWidth = 1
        backgroundColor = #colorLiteral(red: 0.9449954033, green: 0.9451572299, blue: 0.9449852109, alpha: 1)
        layer.masksToBounds = true
        setupViews()
    }
    
    func setupViews() {
        addSubview(lbl)
        lbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lbl.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lbl.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    let lbl: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//get first day of the month
extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
}

//get date from string
extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var date: Date? {
        return String.dateFormatter.date(from: self)
    }
}

