//
//  MainViewController.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import UIKit

protocol SettingsDelegate : AnyObject{
    func changeRules(gameMode : Bool)
    func changeLanguage(lanEn : Bool)
    var rulesWithoutRepeat : Bool {get set}
    var languageIsEnglish : Bool {get set}
}

final class MainViewController : UIViewController {
    
    var languageIsEnglish: Bool = false
    var rulesWithoutRepeat : Bool = false

    let options = ["Камень", "Ножницы", "Бумага"]
    var randomItem : String = ""
    var currentItem : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureItem()
    }
    
    let verticalStackView : UIStackView = {
        var verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 20
        verticalStackView.spacing = UIStackView.spacingUseSystem
        
        return verticalStackView
    }()
    
    lazy var stoneButton : UIButton = {
        let stoneButton = UIButton()
        stoneButton.center = view.center
        stoneButton.setImage(UIImage(named: "stoneImage.png"), for: .normal)
        stoneButton.setTitle("Камень", for: .normal)
        stoneButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        
        return stoneButton
    } ()
    
    lazy var scissorButton : UIButton = {
        let scissorButton = UIButton()
        scissorButton.center = view.center
        scissorButton.setImage(UIImage(named: "scissorsImage.png"), for: .normal)
        scissorButton.setTitle("Ножницы", for: .normal)
        scissorButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        
        return scissorButton
    } ()
    
    lazy var paperButton : UIButton = {
        let paperButton = UIButton()
        view.addSubview(paperButton)
        paperButton.center = view.center
        paperButton.setImage(UIImage(named: "paperImage.png"), for: .normal)
        paperButton.setTitle("Бумага", for: .normal)
        paperButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        
        return paperButton
    } ()
    
     let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Chose your item"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        return titleLabel
    } ()
    
   
    
    private func configureItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(didTapButton(_:)))
    }
    
    override func viewDidLayoutSubviews() {
        scissorButton.frame = CGRect(x: 0, y: 0, width: 50 , height: 50)
        paperButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        stoneButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
}

private extension MainViewController {
    
    @objc func didTapButton(_ sender : UIBarButtonItem!) {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        navigationController?.pushViewController(settingsVC, animated: false)
    }
    
    @objc func itemButtonPressed(_ sender: UIButton) {
        currentItem = sender.currentTitle ?? ""
        randomItem = options.randomElement() ?? options[1]
        print(rulesWithoutRepeat)
        if (rulesWithoutRepeat) {
            if (randomItem == currentItem) {
                var optionsWithoutRepeat = options
                optionsWithoutRepeat.remove(object: randomItem)
                randomItem = optionsWithoutRepeat.randomElement() ?? optionsWithoutRepeat[0]
            }
        }
        
        if (languageIsEnglish){
            resultEN()
        }
        else {resultRU()}
    }
    
    private func resultEN(){
        switch (currentItem, randomItem) {
        case ("Ножницы", "Бумага"):
            titleLabel.text = "Win! Opponent chose paper"
        case ("Ножницы", "Камень"):
            titleLabel.text = "Lose. Opponent chose stone"
        case ("Бумага", "Камень"):
            titleLabel.text = "Win! Opponent chose stone"
        case ("Бумага", "Ножницы"):
            titleLabel.text = "Lose. Opponent chose scissor"
        case ("Камень", "Ножницы"):
            titleLabel.text = "Win! Opponent chose scissor"
        case ("Камень", "Бумага"):
            titleLabel.text = "Lose. Opponent chose paper"
        case ("Камень", "Камень"):
            titleLabel.text = "Draw! Opponent think like you"
        case ("Бумага", "Бумага"):
            titleLabel.text = "Draw! Opponent think like you"
        case ("Ножницы", "Ножницы"):
            titleLabel.text = "Draw! Opponent think like you"
        case (_, _):
            print("")
        }
    }
    
    private func resultRU(){
        switch (currentItem, randomItem) {
        case ("Ножницы", "Бумага"):
            titleLabel.text = "Победа! Противник выбрал бумагу"
        case ("Ножницы", "Камень"):
            titleLabel.text = "Проигрыш. Противник выбрал камень"
        case ("Бумага", "Камень"):
            titleLabel.text = "Победа! противник выбрал камень"
        case ("Бумага", "Ножницы"):
            titleLabel.text = "Проигрыш. Противник выбрал ножницы"
        case ("Камень", "Ножницы"):
            titleLabel.text = "Победа! Противник выбрал ножницы"
        case ("Камень", "Бумага"):
            titleLabel.text = "Проигрыш. Противник выбрал бумагу"
        case ("Камень", "Камень"):
            titleLabel.text = "Ничья! Противник думает как ты"
        case ("Бумага", "Бумага"):
            titleLabel.text = "Ничья! Противник думает как ты"
        case ("Ножницы", "Ножницы"):
            titleLabel.text = "Ничья! Противник думает как ты"
        case (_, _):
            print("")
        }
    }
    
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
    
   
}

extension MainViewController: SettingsDelegate {
    func changeRules(gameMode: Bool) {
        rulesWithoutRepeat = gameMode
    }
    
    func changeLanguage(lanEn: Bool) {
        languageIsEnglish = lanEn
    }
}
