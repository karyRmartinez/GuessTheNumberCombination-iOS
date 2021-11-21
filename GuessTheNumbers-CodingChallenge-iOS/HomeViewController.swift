//
//  HomeViewController.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/20/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
   var stackView = UIStackView()
    
    //MARK: UIObjects
    lazy var titlelabel: UILabel = {
        let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.text = "Guess The Combination"
            return label
    }()
    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Enter 4 digit combination"
        return label
    }()
    //MARK: SubViews
    func addSubView() {
        self.view.addSubview(titlelabel)
        self.view.addSubview(instructionsLabel)
        self.view.addSubview(stackView)
    }
    
    private func configureStackView() {
        stackView.axis  = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        setStackViewConstraints()
    }
    
    //MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addSubView()
        configureStackView()
        setTitleLabelConstraints()
        setInstructionLabelConstraints()
        
        
    }
    //MARK: CONSTRAINTS
    func setTitleLabelConstraints() {
         titlelabel.translatesAutoresizingMaskIntoConstraints    = false
         titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
         titlelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         titlelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
    }
    func setInstructionLabelConstraints() {
         instructionsLabel.translatesAutoresizingMaskIntoConstraints    = false
         instructionsLabel.topAnchor.constraint(equalTo: titlelabel.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
         instructionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         instructionsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
    }
    func setStackViewConstraints() {
         stackView.translatesAutoresizingMaskIntoConstraints    = false
         stackView.topAnchor.constraint(equalTo: instructionsLabel.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
         stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
}
