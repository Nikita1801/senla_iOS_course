//
//  SecondaryViewController.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import Foundation
import UIKit

class SecondaryViewController : UIViewController {
    
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
    
    private lazy var horizontalStackView1 : UIStackView = {
        var horizontalStackView1 = UIStackView()
        horizontalStackView1.axis = .horizontal
        horizontalStackView1.alignment = .center
        horizontalStackView1.distribution = .fillEqually
        horizontalStackView1.spacing = 20
        horizontalStackView1.spacing = UIStackView.spacingUseSystem
        
        return horizontalStackView1
    }()
    
    private lazy var horizontalStackView2 : UIStackView = {
        var horizontalStackView2 = UIStackView()
        horizontalStackView2.axis = .horizontal
        horizontalStackView2.alignment = .center
        horizontalStackView2.distribution = .fillEqually
        horizontalStackView2.spacing = 20
        horizontalStackView2.spacing = UIStackView.spacingUseSystem
        
        return horizontalStackView2
    }()

    private lazy var horizontalStackView3 : UIStackView = {
        var horizontalStackView3 = UIStackView()
        horizontalStackView3.axis = .horizontal
        horizontalStackView3.alignment = .center
        horizontalStackView3.distribution = .fillEqually
        horizontalStackView3.spacing = 20
        horizontalStackView3.spacing = UIStackView.spacingUseSystem
        
        return horizontalStackView3
    }()

    
    private var diceImage1 : UIImageView = {
        let diceImage1 = UIImageView()
        diceImage1.image = UIImage(named: "dice1.png")
        diceImage1.alpha = 0.5
        return diceImage1
    }()

    private var diceImage2 : UIImageView = {
        let diceImage2 = UIImageView()
        diceImage2.image =  UIImage(named: "dice2.png")!
        diceImage2.alpha = 0.5
        
        return diceImage2
    }()
    
    private var diceImage3 : UIImageView = {
        let diceImage3 = UIImageView()
        diceImage3.image = UIImage(named: "dice3.png")
        diceImage3.alpha = 0.5
        
        return diceImage3
    }()
    
    private var diceImage4 : UIImageView = {
        let diceImage4 = UIImageView()
        diceImage4.image = UIImage(named: "dice4.png")!
        diceImage4.alpha = 0.5
        
        return diceImage4
    }()
    
    private var diceImage5 : UIImageView = {
        let diceImage5 = UIImageView()
        diceImage5.image = UIImage(named: "dice5.png")!
        diceImage5.alpha = 0.5
        
        return diceImage5
    }()
    
    private var diceImage6 : UIImageView = {
        let diceImage6 = UIImageView()
        diceImage6.image = UIImage(named: "dice6.png")!
        diceImage6.alpha = 0.5
        
        return diceImage6
    }()
    
    private var rollButton : UIButton = {
        let rollButton = UIButton()
        rollButton.setTitle("ROLL", for: .normal)
        rollButton.backgroundColor = .systemRed
        rollButton.addTarget(self, action: #selector(rollButtonPressed(_:)), for: .touchUpInside)
        
        return rollButton
    }()
    
    @objc func rollButtonPressed(_ sender : AnyObject?) {
        diceImage1.alpha = 0.5
        diceImage2.alpha = 0.5
        diceImage3.alpha = 0.5
        diceImage4.alpha = 0.5
        diceImage5.alpha = 0.5
        diceImage6.alpha = 0.5
        
        let randomDice = Int.random(in: 1...6)
        switch randomDice {
        case 1:
            diceImage1.alpha = 1
        case 2:
            diceImage2.alpha = 1
        case 3:
            diceImage3.alpha = 1
        case 4:
            diceImage4.alpha = 1
        case 5:
            diceImage5.alpha = 1
        case 6:
            diceImage6.alpha = 1
        default:
            diceImage1.alpha = 1
        }
    }
}

extension SecondaryViewController {
    func configureView() {
        horizontalStackView1.addArrangedSubview(diceImage1)
        horizontalStackView1.addArrangedSubview(diceImage2)
        horizontalStackView2.addArrangedSubview(diceImage3)
        horizontalStackView2.addArrangedSubview(diceImage4)
        horizontalStackView3.addArrangedSubview(diceImage5)
        horizontalStackView3.addArrangedSubview(diceImage6)
        
        verticalStackView.addArrangedSubview(horizontalStackView1)
        verticalStackView.addArrangedSubview(horizontalStackView2)
        verticalStackView.addArrangedSubview(horizontalStackView3)
        verticalStackView.addArrangedSubview(rollButton)
        
        view.addSubview(verticalStackView)
        
        makeConstraints()
    }
    
    func makeConstraints() {
        horizontalStackView1.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView2.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView3.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            horizontalStackView1.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            horizontalStackView1.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 100),
            horizontalStackView1.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -100),
            horizontalStackView1.bottomAnchor.constraint(equalTo: horizontalStackView2.topAnchor, constant: -20),
            
            horizontalStackView2.topAnchor.constraint(equalTo: horizontalStackView2.bottomAnchor),
            horizontalStackView2.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 100),
            horizontalStackView2.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -100),
            horizontalStackView2.bottomAnchor.constraint(equalTo: horizontalStackView3.topAnchor, constant: -20),
            
            horizontalStackView3.topAnchor.constraint(equalTo: horizontalStackView2.bottomAnchor),
            horizontalStackView3.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 100),
            horizontalStackView3.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -100),
            horizontalStackView3.bottomAnchor.constraint(equalTo: rollButton.topAnchor, constant: -150),
            
            rollButton.topAnchor.constraint(equalTo: horizontalStackView2.bottomAnchor, constant: 400),
            rollButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 100),
            rollButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -100),
            rollButton.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor)
            
        ])
    }
}
