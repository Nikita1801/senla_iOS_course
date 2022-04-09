//
//  SettingsViewController.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import Foundation
import UIKit


class SettingsViewController : ViewController {
    weak var delegate : MainViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
  
        configureView()
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
    
    private lazy var languageLabel : UILabel = {
        let languageLabel = UILabel()
        languageLabel.text = "Choose your language (RU / EN)"
        languageLabel.font = UIFont.boldSystemFont(ofSize: 24)
        languageLabel.textAlignment = .center
        languageLabel.numberOfLines = 0
        
        return languageLabel
    } ()
    
    private lazy var languageSwitch : UISwitch = {
        let languageSwitch = UISwitch()
        if let delegate = delegate {
            languageSwitch.setOn(delegate.languageIsEnglish, animated: true)
        }
        else {
            languageSwitch.setOn(false, animated: true)
        }
        languageSwitch.addTarget(self, action: #selector(switchLanguageDidTaped(_:)), for: .valueChanged)
        
        return languageSwitch
    } ()
    
    private lazy var rulesLabel : UILabel = {
        let rulesLabel = UILabel()
        rulesLabel.text = "Choose your game style (Draw / Without Draw)"
        rulesLabel.font = UIFont.boldSystemFont(ofSize: 24)
        rulesLabel.textAlignment = .center
        rulesLabel.numberOfLines = 0
        
        return rulesLabel
    } ()
    
    private lazy var rulesSwitch : UISwitch = {
        let rulesSwitch = UISwitch()
        if let delegate = delegate {
            rulesSwitch.setOn(delegate.rulesWithoutRepeat, animated: true)
        }
        else {
            rulesSwitch.setOn(false, animated: true)
        }
        rulesSwitch.addTarget(self, action: #selector(switchRulesDidTaped(_:)), for: .valueChanged)
        
        return rulesSwitch
    } ()
     
}

extension SettingsViewController{
    
    func configureView() {
        view.backgroundColor = .white
        verticalStackView.addArrangedSubview(languageLabel)
        verticalStackView.addArrangedSubview(languageSwitch)
        verticalStackView.addArrangedSubview(rulesLabel)
        verticalStackView.addArrangedSubview(rulesSwitch)
        view.addSubview(verticalStackView)
        
        makeConstraints()
    }
    
    func makeConstraints() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageSwitch.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            languageLabel.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 0),
            languageLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            languageLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            languageLabel.bottomAnchor.constraint(equalTo: languageSwitch.topAnchor, constant: 100),
            
            languageSwitch.topAnchor.constraint(equalTo: languageLabel.bottomAnchor),
            languageSwitch.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 35),
            languageSwitch.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            languageSwitch.bottomAnchor.constraint(equalTo: rulesLabel.topAnchor, constant: 400),
            
            rulesLabel.topAnchor.constraint(equalTo: languageSwitch.bottomAnchor),
            rulesLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            rulesLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            rulesLabel.bottomAnchor.constraint(equalTo: rulesSwitch.topAnchor, constant: 100),
            
            rulesSwitch.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor),
            rulesSwitch.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 35),
            rulesSwitch.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            rulesSwitch.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor)
        ])
    }
    
    @objc func switchRulesDidTaped(_ sender : UISwitch!) {
        delegate?.changeRules(gameMode: sender.isOn)
    }
    
    @objc func switchLanguageDidTaped(_ sender : UISwitch!) {
        delegate?.changeLanguage(lanEn: sender.isOn)
        print(delegate?.changeLanguage(lanEn: sender.isOn))
    }
}
