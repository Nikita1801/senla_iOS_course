//
//  HistoryGameTableViewCell.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 18.05.2022.
//

import UIKit

class HistoryGameTableViewCell: UITableViewCell {
    
    var gameResult = UILabel()
    var userChoiceImage = UIImage()
    var enemyChoiceImage = UIImage()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
