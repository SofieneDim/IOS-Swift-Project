//
//  ListDetailViewControllerDelegate.swift
//  Checklists
//
//  Created by Dimessi on 7/30/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//


protocol ListDetailViewControllerDelegate: class {
    
    func listDetailViewControllerDidCancel(
        _ controller: ListDetailViewController)
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishAdding checklist: Checklist)
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishEditing checklist: Checklist)
    
}
