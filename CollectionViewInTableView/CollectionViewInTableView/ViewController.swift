//
//  ViewController.swift
//  CollectionViewInTableView
//
//  Created by MANOJ AHER on 4/2/20.
//  Copyright © 2020 MANOJ AHER. All rights reserved.
//

import UIKit

enum CellType: Int, CaseIterable {
    case newMatches = 0
    case messages
}

struct NewMatch {
    let name: String
    let imageName: String
}

class ViewController: UIViewController {
    
    enum Constants {
        static let nibName = "CollectionTableViewCell"
        static let reuseIdentifier = "CollectionTableViewCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var newMatches: [NewMatch] = []
    private var newMessages: [NewMatch] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        createDataSource()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        let nibName = UINib(nibName: Constants.nibName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: Constants.reuseIdentifier)
    }
    
    private func createDataSource() {
        for i in 0...3 {
            let newMatch = NewMatch(name: "Matches \(i)", imageName: "image_1")
            newMatches.append(newMatch)
        }
        
        for i in 0...3 {
            let newMatch = NewMatch(name: "Messages \(i)", imageName: "image_1")
            newMessages.append(newMatch)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        var dataSource: [NewMatch] = []
        let cellType = CellType(rawValue: indexPath.section)
        switch cellType {
        case .newMatches:   dataSource = newMatches
        case .messages:     dataSource = newMessages
        case .none: break
        }
        cell.update(newModels: dataSource)
        
        return cell
    }
    
}
