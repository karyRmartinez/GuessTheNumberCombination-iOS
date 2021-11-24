//
//  IntroViewController.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/23/21.
//

import UIKit

class IntroViewController: UIViewController {

    lazy var imageViewSet : UIImageView = {
    let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.animationImages = [
        UIImage(named:"" )!,
        UIImage(named:"")!
        ]
        image.animationDuration = 1
        return image
   
       }()
 
    lazy var loginButton: UIButton = {
          let button = UIButton()
          button.setTitle("Play", for: .normal)
        button.backgroundColor = .systemPink
          button.translatesAutoresizingMaskIntoConstraints = false
          button.layer.cornerRadius = 12
         button.addTarget(self, action: #selector(self.startButtonPressed(sender:)), for: .touchUpInside)
          return button
      }()

    @objc func startButtonPressed(sender: UIButton) {
    //self.animateView(sender)
    self.navigationController?.pushViewController(MainViewController(), animated: true)
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        view.backgroundColor = .white
        imageViewSet.startAnimating()
        addSubviews()
        settingUpConstraints()

    }
    private func addSubviews() {
      
        self.view.addSubview(imageViewSet)
        
    }
    private func settingUpConstraints() {
        NSLayoutConstraint.activate([
       imageViewSet.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 40),
        imageViewSet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        imageViewSet.widthAnchor.constraint(equalToConstant: 100),
        imageViewSet.heightAnchor.constraint(equalToConstant: 100),
        
      
                   
        ])
    }
}
