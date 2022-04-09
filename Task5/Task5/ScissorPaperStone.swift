//
//  ScissorPaperStone.swift
//  Task5
//
//  Created by Никита Макаревич on 07.04.2022.
//

import Foundation
import UIKit

class ScissorPaperStoneViewController : UIViewController {
  
    let options = ["Камень", "Ножницы", "Бумага"]
    var randomItem : String = ""
    var languageIsEnglish: Bool = false
    var rulesWithoutRepeat : Bool = false

    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var scissorButton: UIButton!
//    @IBOutlet weak var paperButton: UIButton!
//    @IBOutlet weak var stoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(settingsDidTap))
        titleLabel.numberOfLines = 0
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        print(sender.currentTitle)
        let currentItem = sender.currentTitle!
        randomItem = options.randomElement()!
        print(rulesWithoutRepeat)
        if (rulesWithoutRepeat) {
            if (randomItem == currentItem) {
                var optionsWithoutRepeat = options
                optionsWithoutRepeat.remove(object: randomItem)
                randomItem = optionsWithoutRepeat.randomElement()!
            }
        }
        
        switch languageIsEnglish {
        case false:
            if (currentItem == "Ножницы" && randomItem == "Бумага") {
                titleLabel.text = "Победа! Противник выбрал бумагу"
            }
            else if (currentItem == "Ножницы"  && randomItem == "Камень"){
                titleLabel.text = "Проигрыш. Противник выбрал камень"
            }
            else if (currentItem == "Бумага" && randomItem == "Камень") {
                titleLabel.text = "Победа! противник выбрал камень"
            }
            else if (currentItem == "Бумага" && randomItem == "Ножницы") {
                titleLabel.text = "Проигрыш. Противник выбрал ножницы"
            }
            else if (currentItem == "Камень" && randomItem == "Ножницы") {
                titleLabel.text = "Победа! Противник выбрал ножницы"
            }
            else if (currentItem == "Камень" && randomItem == "Бумага") {
                titleLabel.text = "Проигрыш. Противник выбрал бумагу"
            }
            else if (currentItem == randomItem) {
                titleLabel.text = "Ничья! Противник думает как ты"
            }
            else {titleLabel.text = "wrong"}
        case true:
            if (currentItem == "Ножницы" && randomItem == "Бумага") {
                titleLabel.text = "Win! Opponent chose paper"
            }
            else if (currentItem == "Ножницы"  && randomItem == "Камень"){
                titleLabel.text = "Lose. Opponent chose stone"
            }
            else if (currentItem == "Бумага" && randomItem == "Камень") {
                titleLabel.text = "Win! Opponent chose stone"
            }
            else if (currentItem == "Бумага" && randomItem == "Ножницы") {
                titleLabel.text = "Lose. Opponent chose scissor"
            }
            else if (currentItem == "Камень" && randomItem == "Ножницы") {
                titleLabel.text = "Win! Opponent chose scissor"
            }
            else if (currentItem == "Камень" && randomItem == "Бумага") {
                titleLabel.text = "Lose. Opponent chose paper"
            }
            else if (currentItem == randomItem) {
                titleLabel.text = "Draw! Opponent think like you"
            }
        }
        
        
    }
    
    
    @objc func settingsDidTap() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        navigationController?.pushViewController(settingsVC, animated: false)
    }
}

extension Array where Element: Equatable {
        
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
        }
}
