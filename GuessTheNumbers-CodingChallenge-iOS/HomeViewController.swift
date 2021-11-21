//
//  HomeViewController.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/20/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    //MARK: UIObjects
    lazy var Titlelabel: UILabel = {
        let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.text = "Guess The Combination"
        return label
    }()
    
    func addSubView() {
        self.view.addSubview(Titlelabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        setTitleLabelConstraints()
        
    }
    //MARK: CONSTRAINTS
    func setTitleLabelConstraints() {
         Titlelabel.translatesAutoresizingMaskIntoConstraints    = false
         Titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
         Titlelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         Titlelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
    }
}
