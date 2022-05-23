//
//  GameHistory.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 25.04.2022.
//

import UIKit

protocol ResultsDelegate: AnyObject{
    var newResult : String { get set }
    func appendResult(newResult : String)
}


class StatisticsViewController : UIViewController {
    
    var newResult: String = ""
    var historyTableView = UITableView()
    var resultsArray: [String] = []
    var resultToAdd: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemRed
        configureView()
        
        let mainVC = MainViewController()
        mainVC.resultDelegate = self
    }
    
    func configureView(){
        view.addSubview(historyTableView)
        setTableViewDelegates()
        historyTableView.rowHeight = 70
        setConstraints()
    }
    

    func setTableViewDelegates() {
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    func setConstraints() {
        historyTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            historyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            historyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
    }
    
}

extension StatisticsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
extension StatisticsViewController: ResultsDelegate{
    
    func appendResult(newResult: String) {
        resultToAdd = newResult
        print(resultToAdd)
        
        //resultsArray.append(resultToAdd)
    }
    
    
}


