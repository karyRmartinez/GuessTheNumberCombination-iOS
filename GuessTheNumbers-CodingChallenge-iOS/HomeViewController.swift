//
//  HomeViewController.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/25/21.
//

import Foundation
import UIKit




class MainViewController: UIViewController {
    
 
    let callToAction = GTNButton(backgrounfColor: .systemPink , title: "Enter")
    
    
    private var diffCombination: String = ""
    private var guesses: [String] = []
    private var guessDict: [String:[Int]] = [:]
    private var victory: Bool = false
    private var streak: Int = 0
    
    //MARK: UIObjects
    lazy var titlelabel: UILabel = {
        let label               = UILabel()
            label.textAlignment = .center
            label.font          = UIFont.boldSystemFont(ofSize: 15)
          //  label.text          = "Enter 4 digit Guess"
            return label
    }()
    lazy var previousGuessLabel: UILabel = {
        let label           = UILabel()
        label.textAlignment = .center
        label.font          = UIFont.boldSystemFont(ofSize: 15)
        label.text          = "Previous Guess below"
        return label
    }()
    lazy var boxOneTextField: UITextField = {
         let textField                 = UITextField()
           textField .translatesAutoresizingMaskIntoConstraints = false
           textField .borderStyle      = .line
           textField .backgroundColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           textField.layer.borderColor = UIColor.black.cgColor
        textField.attributedPlaceholder = NSAttributedString(string: "guess here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
           return textField
    }()
    //MARK: SubViews
    func addSubView() {
        self.view.addSubview(titlelabel)
        self.view.addSubview(previousGuessLabel)
        self.view.addSubview(boxOneTextField)
    }

    
    private func NavigationBarTitle() {
         self.title = "Guess The Numbers"
     }


    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubView()
        NavigationBarTitle()
        setConstraints()
        configureCallToAction()
     
    }
   
    



    //MARK: CONSTRAINTS
    func setConstraints() {
         titlelabel.translatesAutoresizingMaskIntoConstraints    = false
         titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
         titlelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         titlelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        
        boxOneTextField.translatesAutoresizingMaskIntoConstraints    = false
        boxOneTextField.topAnchor.constraint(equalTo: titlelabel.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        boxOneTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        boxOneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-10).isActive = true
        
        previousGuessLabel.translatesAutoresizingMaskIntoConstraints    = false
        previousGuessLabel.bottomAnchor.constraint(equalTo: boxOneTextField.safeAreaLayoutGuide.bottomAnchor, constant: 200).isActive = true
        previousGuessLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        previousGuessLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-10).isActive = true
    }
   
    func configureCallToAction() {
        view.addSubview(callToAction)
        NSLayoutConstraint.activate([
        callToAction.bottomAnchor.constraint(equalTo: boxOneTextField.safeAreaLayoutGuide.bottomAnchor,constant: 100),
        callToAction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        callToAction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        callToAction.heightAnchor.constraint(equalToConstant: 50)
       
        ])
    }
    
}


