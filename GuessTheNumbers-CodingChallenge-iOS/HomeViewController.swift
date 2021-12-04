//
//  HomeViewController.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/25/21.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func requestDigits() -> String?
    func gameOver()
}
class MainViewController: UIViewController {
    
    weak var delegate: GameViewControllerDelegate?
    

    private var diffCombination: String = ""
    private var guesses: [String] = []
    private var guessDict: [String:[Int]] = [:]
    private var sucessfulGame: Bool = false
    private var streak: Int = 0
    
    //MARK: UIObjects
    lazy var titlelabel: UILabel = {
        let label               = UILabel()
            label.textAlignment = .center
            label.font          = UIFont.boldSystemFont(ofSize: 15)
        label.text          = "Enter 4 digit Guess"
            return label
    }()
    lazy var hiddenNumlabel: UILabel = {
        let label               = UILabel()
            label.textAlignment = .center
            label.font          = UIFont.boldSystemFont(ofSize: 15)
//          label.text          = "comb"
            return label
    }()
    lazy var resutOfGuessLabel: UILabel = {
        let label           = UILabel()
        label.textAlignment = .center
        label.font          = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    lazy var NumOfTries: UILabel = {
        let label           = UILabel()
        label.textAlignment = .center
        label.font          = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Number Of Tries /"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var boxOneTextField: UITextField = {
         let textField                 = UITextField()
           textField .translatesAutoresizingMaskIntoConstraints = false
           textField .borderStyle      = .line
           textField .backgroundColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           textField.keyboardType = .numberPad
           textField.layer.borderColor = UIColor.black.cgColor
        textField.attributedPlaceholder = NSAttributedString(string: "guess here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
           return textField
    }()
    lazy var GTNButton: UIButton = {
          let button = UIButton()
          button.setTitle("Guess", for: .normal)
        button.backgroundColor = .systemPink
          button.translatesAutoresizingMaskIntoConstraints = false
          button.layer.cornerRadius = 12
         button.addTarget(self, action: #selector(self.enterButtonPressed(sender:)), for: .touchUpInside)
          return button
      }()
    lazy var PreviousButton: UIButton = {
          let button = UIButton()
          button.setTitle("Previous", for: .normal)
        button.backgroundColor = .systemPink
          button.translatesAutoresizingMaskIntoConstraints = false
          button.layer.cornerRadius = 12
         button.addTarget(self, action: #selector(self.enterButtonPressed(sender:)), for: .touchUpInside)
          return button
      }()
    //MARK: SubViews
    func addSubView() {
        self.view.addSubview(titlelabel)
        self.view.addSubview(resutOfGuessLabel)
        self.view.addSubview(boxOneTextField)
        self.view.addSubview(hiddenNumlabel)
        self.view.addSubview(NumOfTries)
        self.view.addSubview(PreviousButton)
    }
    //MARK: NavigationTitle
    
    private func NavigationBarTitle() {
         self.title = "Guess The Numbers"
     }
    
    //MARK: Fuctions
    func textField(_ boxOneTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
          return string.rangeOfCharacter(from: invalidCharacters) == nil
      }
    //MARK: OBJC Functions
   @objc func onEditNextToggle(_ textField: UITextField) {
        //GTNButton.textField.text != ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @objc func enterButtonPressed(sender: UIButton) {
     displayResults()
       }

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubView()
        NavigationBarTitle()
        setConstraints()
        setTriesContraints()
        configureCallToAction()
        setPreviousContraints()
       

        if let newCombo = delegate?.requestDigits() {
            diffCombination = newCombo
        } else {
           print("error")
        }
        boxOneTextField.addTarget(self, action: #selector(onEditNextToggle(_:)), for: .editingChanged)
        
        var encode: String = ""
        for _ in 0..<diffCombination.count {
            encode = encode + "X"
        }
        hiddenNumlabel.text = encode
      
    }
   // chnage hidden to  true
    private func displayResults() {
        if !hiddenNumlabel.isHidden {
            hiddenNumlabel.isHidden = false
        }
        let guess = boxOneTextField.text ?? ""
        if guess.count < diffCombination.count {
            resutOfGuessLabel.text = "Not enough digits, try again."
            titlelabel.text = ""
           
        } else if guess.count > diffCombination.count {
            resutOfGuessLabel.text = "Too many digits, try again."
            titlelabel.text = ""
           
        } else if guessDict[guess] != nil {
            resutOfGuessLabel.text = "Already tried this, try again."
            titlelabel.text = ""
        } else {
            let matches = diffCombination.match(other: guess)
            sucessfulGame = matches[0] == 4 && matches[1] == 4
            let resultText = matches[0] > 0 ? "\(matches[0]) digits matched!" : "No digits matched."
            let titleText = matches[1] > 0 ? "\(matches[1]) in right place!" : ""
            resutOfGuessLabel.text = resultText
            titlelabel.text = titleText
            guesses.append(guess)
            guessDict[guess] = matches
        }
        if sucessfulGame {
            print("yayyy")
        } else {
            if guesses.count == 10 {
                print("opps")
            }
        }
        let triesLeft = 10 - guesses.count
        boxOneTextField.text = ""
    }
  


    //MARK: CONSTRAINTS
    func setConstraints() {
         titlelabel.translatesAutoresizingMaskIntoConstraints    = false
         titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
         titlelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         titlelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        
        hiddenNumlabel.translatesAutoresizingMaskIntoConstraints    = false
        hiddenNumlabel.bottomAnchor.constraint(equalTo: titlelabel.safeAreaLayoutGuide.bottomAnchor, constant: 35).isActive = true
        hiddenNumlabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        hiddenNumlabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        
        boxOneTextField.translatesAutoresizingMaskIntoConstraints    = false
        boxOneTextField.topAnchor.constraint(equalTo: hiddenNumlabel.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        boxOneTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        boxOneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        
        resutOfGuessLabel.translatesAutoresizingMaskIntoConstraints    = false
        resutOfGuessLabel.bottomAnchor.constraint(equalTo: boxOneTextField.safeAreaLayoutGuide.bottomAnchor, constant: 200).isActive = true
        resutOfGuessLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        resutOfGuessLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:-10).isActive = true
     
    }
   
    func configureCallToAction() {
        view.addSubview(GTNButton)
        NSLayoutConstraint.activate([
        GTNButton.bottomAnchor.constraint(equalTo: boxOneTextField.safeAreaLayoutGuide.bottomAnchor,constant: 150),
        GTNButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        GTNButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        GTNButton.heightAnchor.constraint(equalToConstant: 50)
       
        ])
    }
    func setTriesContraints() {
        NSLayoutConstraint.activate([
         NumOfTries.heightAnchor.constraint(equalToConstant: 20),
         NumOfTries.widthAnchor.constraint(equalToConstant: 150),
         NumOfTries.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
         NumOfTries.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
            ])
         }
    func setPreviousContraints() {
        NSLayoutConstraint.activate([
         PreviousButton.heightAnchor.constraint(equalToConstant: 30),
         PreviousButton.widthAnchor.constraint(equalToConstant: 150),
         PreviousButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: -20),
         PreviousButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
            ])
         }
}



