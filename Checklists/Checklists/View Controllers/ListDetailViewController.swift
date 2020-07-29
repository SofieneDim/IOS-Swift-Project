//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Dimessi on 7/29/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit


class ListDetailViewController: UITableViewController,
                                UITextFieldDelegate,
                                IconPickerViewControllerDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var iconImage: UIImageView!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    var checklistToEdit: Checklist?
    var iconName = "Folder"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
            iconName = checklist.iconName
        }
        iconImage.image = UIImage(named: iconName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK:- Actions
    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        if let checklist = checklistToEdit {
            checklist.name = textField.text!
            checklist.iconName = iconName
            delegate?.listDetailViewController(self,
                                               didFinishEditing: checklist)
            navigationController?.popViewController(animated: true)
        } else {
            let checklist = Checklist(name: textField.text!,
                                      iconName: iconName)
            delegate?.listDetailViewController(self,
                                               didFinishAdding: checklist)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    
    // MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath)
        -> IndexPath? {
            return indexPath.section == 1 ? indexPath : nil
    }
    
    
    // MARK:- Icon Picker View Controller Delegate
    func iconPicker(_ picker: IconPickerViewController,
                    didPick iconName: String) {
        self.iconName = iconName
        iconImage.image = UIImage(named: iconName)
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "PickIcon" {
            let controller = segue.destination
                as! IconPickerViewController
            controller.delegate = self
        }
    }
    
    
    
    
    
}

