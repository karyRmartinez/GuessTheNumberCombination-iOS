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
    let callToAction = GTNButton(backgrounfColor: .systemPink , title: "Enter")
    
    //MARK: UIObjects
    lazy var titlelabel: UILabel = {
        let label               = UILabel()
            label.textAlignment = .center
            label.font          = UIFont.boldSystemFont(ofSize: 20)
            label.text          = "Guess The Combination"
            return label
    }()
    lazy var instructionsLabel: UILabel = {
        let label           = UILabel()
        label.textAlignment = .center
        label.font          = UIFont.boldSystemFont(ofSize: 15)
        label.text          = "Enter 4 digit combination"
        return label
    }()
    lazy var boxOneTextField: UITextField = {
           let textField = UITextField()
           textField .translatesAutoresizingMaskIntoConstraints = false
           textField .borderStyle = .line
           textField .backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           textField.layer.borderColor = UIColor.black.cgColor
           return textField
       }()
    lazy var boxTwoTextField: UITextField = {
           let textField = UITextField()
           textField .translatesAutoresizingMaskIntoConstraints = false
           textField .borderStyle = .line
           textField .backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           textField.layer.borderColor = UIColor.black.cgColor
           return textField
       }()
    lazy var boxThreeTextField: UITextField = {
           let textField = UITextField()
           textField .translatesAutoresizingMaskIntoConstraints = false
        textField .borderStyle = .line
           textField .backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           textField.layer.borderColor = UIColor.black.cgColor
           return textField
       }()
    lazy var boxFourTextField: UITextField = {
           let textField = UITextField()
           textField .translatesAutoresizingMaskIntoConstraints = false
        textField .borderStyle = .line
           textField .backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           textField.layer.borderColor = UIColor.black.cgColor
           return textField
       }()
    //MARK: SubViews
    func addSubView() {
        self.view.addSubview(titlelabel)
        self.view.addSubview(instructionsLabel)
        self.view.addSubview(boxOneTextField)
        self.view.addSubview(boxTwoTextField)
        self.view.addSubview(boxThreeTextField)
        self.view.addSubview(boxFourTextField)
    }
    //MARK: Private Functions
    // ToDo: Center number input. Fix StackView Constraints to be centered.
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: [boxOneTextField,boxTwoTextField,boxThreeTextField,boxFourTextField])
        stackView.axis         = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing      = 20
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints    = false
        stackView.topAnchor.constraint(equalTo: instructionsLabel.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
       stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -350).isActive = true
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubView()
        configureStackView()
        setTitleLabelConstraints()
        setInstructionLabelConstraints()
        configureCallToAction()
    
        
    }
    //MARK: CONSTRAINTS
    func setTitleLabelConstraints() {
         titlelabel.translatesAutoresizingMaskIntoConstraints    = false
         titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
         titlelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         titlelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
    }
    func setInstructionLabelConstraints() {
         instructionsLabel.translatesAutoresizingMaskIntoConstraints    = false
         instructionsLabel.topAnchor.constraint(equalTo: titlelabel.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
         instructionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         instructionsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
    }
    func configureCallToAction() {
        view.addSubview(callToAction)
        NSLayoutConstraint.activate([
            callToAction.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            callToAction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToAction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToAction.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
