//
//  SecondaryViewController.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import UIKit

final class SecondaryViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureView()
    }
    
    private let verticalStackView : UIStackView = {
        var verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 20
        verticalStackView.spacing = UIStackView.spacingUseSystem
        
        return verticalStackView
    }()
    
    private let horizontalStackViewOne : UIStackView = {
        var horizontalStackView1 = UIStackView()
        horizontalStackView1.axis = .horizontal
        horizontalStackView1.alignment = .center
        horizontalStackView1.distribution = .fillEqually
        horizontalStackView1.spacing = 20
        horizontalStackView1.spacing = UIStackView.spacingUseSystem
        
        return horizontalStackView1
    }()
    
    private let horizontalStackViewTwo : UIStackView = {
        var horizontalStackView2 = UIStackView()
        horizontalStackView2.axis = .horizontal
        horizontalStackView2.alignment = .center
        horizontalStackView2.distribution = .fillEqually
        horizontalStackView2.spacing = 20
        horizontalStackView2.spacing = UIStackView.spacingUseSystem
        
        return horizontalStackView2
    }()

    private let horizontalStackViewThree : UIStackView = {
        var horizontalStackView3 = UIStackView()
        horizontalStackView3.axis = .horizontal
        horizontalStackView3.alignment = .center
        horizontalStackView3.distribution = .fillEqually
        horizontalStackView3.spacing = 20
        horizontalStackView3.spacing = UIStackView.spacingUseSystem
        
        return horizontalStackView3
    }()

    
    private let diceImageOne : UIImageView = {
        let diceImage1 = UIImageView()
        diceImage1.image = UIImage(named: "dice1.png")
        diceImage1.alpha = 0.5
        return diceImage1
    }()

    private let diceImageTwo : UIImageView = {
        let diceImage2 = UIImageView()
        diceImage2.image =  UIImage(named: "dice2.png")
        diceImage2.alpha = 0.5
        
        return diceImage2
    }()
    
    private let diceImageThree : UIImageView = {
        let diceImage3 = UIImageView()
        diceImage3.image = UIImage(named: "dice3.png")
        diceImage3.alpha = 0.5
        
        return diceImage3
    }()
    
    private let diceImageFour : UIImageView = {
        let diceImage4 = UIImageView()
        diceImage4.image = UIImage(named: "dice4.png")
        diceImage4.alpha = 0.5
        
        return diceImage4
    }()
    
    private let diceImageFive : UIImageView = {
        let diceImage5 = UIImageView()
        diceImage5.image = UIImage(named: "dice5.png")
        diceImage5.alpha = 0.5
        
        return diceImage5
    }()
    
    private let diceImageSix : UIImageView = {
        let diceImage6 = UIImageView()
        diceImage6.image = UIImage(named: "dice6.png")
        diceImage6.alpha = 0.5
        
        return diceImage6
    }()
    
    private let rollButton : UIButton = {
        let rollButton = UIButton()
        rollButton.setTitle("ROLL", for: .normal)
        rollButton.backgroundColor = .systemRed
        rollButton.addTarget(self, action: #selector(rollButtonPressed(_:)), for: .touchUpInside)
        
        return rollButton
    }()
    
    @objc private func rollButtonPressed(_ sender : UIButton) {
        diceImageOne.alpha = 0.5
        diceImageTwo.alpha = 0.5
        diceImageThree.alpha = 0.5
        diceImageFour.alpha = 0.5
        diceImageFive.alpha = 0.5
        diceImageSix.alpha = 0.5
        
        let randomDice = Int.random(in: 1...6)
        switch randomDice {
        case 1:
            diceImageOne.alpha = 1
        case 2:
            diceImageTwo.alpha = 1
        case 3:
            diceImageThree.alpha = 1
        case 4:
            diceImageFour.alpha = 1
        case 5:
            diceImageFive.alpha = 1
        case 6:
            diceImageSix.alpha = 1
        default:
            diceImageOne.alpha = 1
        }
    }
}

private extension SecondaryViewController {
    func configureView() {
        horizontalStackViewOne.addArrangedSubview(diceImageOne)
        horizontalStackViewOne.addArrangedSubview(diceImageTwo)
        horizontalStackViewTwo.addArrangedSubview(diceImageThree)
        horizontalStackViewTwo.addArrangedSubview(diceImageFour)
        horizontalStackViewThree.addArrangedSubview(diceImageFive)
        horizontalStackViewThree.addArrangedSubview(diceImageSix)
        
        verticalStackView.addArrangedSubview(horizontalStackViewOne)
        verticalStackView.addArrangedSubview(horizontalStackViewTwo)
        verticalStackView.addArrangedSubview(horizontalStackViewThree)
        verticalStackView.addArrangedSubview(rollButton)
        
        view.addSubview(verticalStackView)
        
        makeConstraints()
    }
    
    func makeConstraints() {
        horizontalStackViewOne.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackViewTwo.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackViewThree.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            horizontalStackViewOne.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            horizontalStackViewOne.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 100),
            horizontalStackViewOne.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -100),
            horizontalStackViewOne.bottomAnchor.constraint(equalTo: horizontalStackViewTwo.topAnchor, constant: -20),
            
            horizontalStackViewTwo.topAnchor.constraint(equalTo: horizontalStackViewTwo.bottomAnchor),
            horizontalStackViewTwo.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 100),
            horizontalStackViewTwo.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -100),
            horizontalStackViewTwo.bottomAnchor.constraint(equalTo: horizontalStackViewThree.topAnchor, constant: -20),
            
            horizontalStackViewThree.topAnchor.constraint(equalTo: horizontalStackViewTwo.bottomAnchor),
            horizontalStackViewThree.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 100),
            horizontalStackViewThree.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -100),
            horizontalStackViewThree.bottomAnchor.constraint(equalTo: rollButton.topAnchor, constant: -150),
            
            rollButton.topAnchor.constraint(equalTo: horizontalStackViewTwo.bottomAnchor, constant: 400),
            rollButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 100),
            rollButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -100),
            rollButton.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor)
            
        ])
    }
}
