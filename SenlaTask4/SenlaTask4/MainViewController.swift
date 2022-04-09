//
//  MainViewController.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import Foundation
import UIKit

protocol MainVCDelegate : AnyObject{
    func changeRules(gameMode : Bool)
    func changeLanguage(lanEn : Bool)
    var rulesWithoutRepeat : Bool {get set}
    var languageIsEnglish : Bool {get set}
}

class MainViewController : UIViewController, MainVCDelegate {
    
    var languageIsEnglish: Bool = false
    var rulesWithoutRepeat : Bool = false

    let options = ["Камень", "Ножницы", "Бумага"]
    var randomItem : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureItem()
    }
    
    private lazy var verticalStackView : UIStackView = {
        var verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 20
        verticalStackView.spacing = UIStackView.spacingUseSystem
        
        return verticalStackView
    }()
    
    private lazy var stoneButton : UIButton = {
        let stoneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        stoneButton.center = view.center
        stoneButton.setImage(UIImage(named: "stoneImage.png"), for: .normal)
        stoneButton.setTitle("Камень", for: .normal)
        stoneButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        
        return stoneButton
    } ()
    
    private lazy var scissorButton : UIButton = {
        let scissorButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        scissorButton.center = view.center
        scissorButton.setImage(UIImage(named: "scissorsImage.png"), for: .normal)
        scissorButton.setTitle("Ножницы", for: .normal)
        scissorButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        
        return scissorButton
    } ()
    
    private lazy var paperButton : UIButton = {
        let paperButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.addSubview(paperButton)
        paperButton.center = view.center
        paperButton.setImage(UIImage(named: "paperImage.png"), for: .normal)
        paperButton.setTitle("Бумага", for: .normal)
        paperButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        
        return paperButton
    } ()
    
    private lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Chose your item"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        return titleLabel
    } ()
    
    @objc func itemButtonPressed(_ sender: UIButton) {
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
    
    private func configureItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(didTapButton(_:)))
    }
    @objc func didTapButton(_ sender : UIBarButtonItem!) {
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

extension MainViewController {
    
    func configureView() {
        view.backgroundColor = .white
        verticalStackView.addArrangedSubview(stoneButton)
        verticalStackView.addArrangedSubview(scissorButton)
        verticalStackView.addArrangedSubview(paperButton)
        verticalStackView.addArrangedSubview(titleLabel)
        view.addSubview(verticalStackView)
        
        makeConstraints()
    }
    
    func makeConstraints() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        stoneButton.translatesAutoresizingMaskIntoConstraints = false
        scissorButton.translatesAutoresizingMaskIntoConstraints = false
        paperButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            stoneButton.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            stoneButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -40),
            stoneButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 40),
            stoneButton.bottomAnchor.constraint(equalTo: scissorButton.topAnchor, constant: -30),
            
            scissorButton.topAnchor.constraint(equalTo: stoneButton.bottomAnchor),
            scissorButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 40),
            scissorButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -40),
            scissorButton.bottomAnchor.constraint(equalTo: paperButton.topAnchor, constant: -30),
            
            paperButton.topAnchor.constraint(equalTo: scissorButton.bottomAnchor),
            paperButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 40),
            paperButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -40),
            paperButton.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -20)
        ])
    }
    
    func changeRules(gameMode: Bool) {
        rulesWithoutRepeat = gameMode
    }
    
    func changeLanguage(lanEn: Bool) {
        languageIsEnglish = lanEn
    }
}
