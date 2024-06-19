//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Sergey Zakurakin on 18/06/2024.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    // MARK: - Propertis
    private let greenColor = UIColor(red: 0.16, green: 0.6, blue: 0.36, alpha: 1)
    
    // MARK: - UI
    private lazy var billTotalLabel = UILabel(textColor: .lightGray, fontSize: 25, alignment: .left)
    private lazy var selectTipLabel = UILabel(textColor: .lightGray, fontSize: 25, alignment: .left)
    private lazy var chooseSplitLabel = UILabel(textColor: .lightGray, fontSize: 25, alignment: .left)
    private lazy var numberOfPeopleLabel = UILabel(textColor: greenColor, fontSize: 36, alignment: .left)
    
    private lazy var backgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 0.78, green: 0.94, blue: 0.89, alpha: 1)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let element = UIStackView()
        element.alignment = .center
        element.distribution = .fillEqually
        element.spacing = 30
        element.axis = .horizontal
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var stepperStackView: UIStackView = {
        let element = UIStackView()
        element.alignment = .center
        element.distribution = .fillEqually
        element.spacing = 0
        element.axis = .horizontal
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var changeNumberOfPeople: UIStepper = {
        let element = UIStepper()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var zeroTipButton = UIButton(text: "0%")
    private lazy var tenTipButton = UIButton(text: "10%")
    private lazy var twentyTipButton = UIButton(text: "20%")
    
    
    
    private lazy var countTextField: UITextField = {
        let element = UITextField()
        element.textAlignment = .center
        element.placeholder = "e.g. 123.56"
        element.font = .systemFont(ofSize: 40)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var calculateButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = greenColor
        element.tintColor = .white
        element.layer.cornerRadius = 10
        element.titleLabel?.font = .systemFont(ofSize: 30)
        element.setTitle("Calculate", for: .normal)
        element.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    @objc private func calculatePressed(_ sender: UIButton) {
        let resultVC = ResultViewController()
//        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.modalPresentationStyle = .fullScreen
        present(resultVC, animated: true)
        
    }
    
    @objc private func tipChanged(_ sender: UIButton) {
        
        zeroTipButton.isSelected = false
        tenTipButton.isSelected = false
        twentyTipButton.isSelected = false
        sender.isSelected = true
        
    }
    
    @objc private func stepperChanged(_ sender: UIStepper) {
        print(sender.value)
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }
}

// MARK: - Setup UI
extension CalculatorViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        view.addSubview(billTotalLabel)
        view.addSubview(countTextField)
        view.addSubview(selectTipLabel)
        view.addSubview(buttonStackView)
        view.addSubview(chooseSplitLabel)
        view.addSubview(stepperStackView)
        view.addSubview(calculateButton)
        
        buttonStackView.addArrangedSubview(zeroTipButton)
        buttonStackView.addArrangedSubview(tenTipButton)
        buttonStackView.addArrangedSubview(twentyTipButton)
        
        stepperStackView.addArrangedSubview(numberOfPeopleLabel)
        stepperStackView.addArrangedSubview(changeNumberOfPeople)
        
        billTotalLabel.text = "Enter bill total"
        selectTipLabel.text = "Select tip"
        chooseSplitLabel.text = "Choose Split"
        numberOfPeopleLabel.text = "2"
        
        zeroTipButton.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        tenTipButton.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        twentyTipButton.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        
        changeNumberOfPeople.addTarget(self, action: #selector(stepperChanged), for: .touchUpInside)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
        
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 155),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            billTotalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            billTotalLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            billTotalLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            countTextField.topAnchor.constraint(equalTo: billTotalLabel.bottomAnchor, constant: 18),
            countTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            countTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
        
            selectTipLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            selectTipLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            buttonStackView.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 25),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            chooseSplitLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            stepperStackView.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 25),
            stepperStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            stepperStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            calculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            calculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
        ])
    }
}

extension UILabel {
    convenience init(textColor: UIColor, fontSize: CGFloat, alignment: NSTextAlignment) {
        self.init()
        self.textColor = textColor
        self.font = .systemFont(ofSize: fontSize)
        self.numberOfLines = 0
        self.textAlignment = alignment
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(text: String) {
        self.init(type: .system)
        self.tintColor = UIColor(red: 0.16, green: 0.6, blue: 0.36, alpha: 1)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 35)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}




