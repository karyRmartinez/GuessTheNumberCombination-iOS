//
//  GTNButton.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/21/21.
//

import UIKit

class GTNButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgrounfColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = .systemPink
        self.setTitle(title, for: .normal)
        configure()
    }

    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}