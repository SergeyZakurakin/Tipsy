//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Sergey Zakurakin on 18/06/2024.
//

import UIKit

class ResultViewController: UIViewController {

    
    // MARK: - Propertis
    
    private let greenColor = UIColor(red: 0.16, green: 0.6, blue: 0.36, alpha: 1)
    var result: String?
    var peopleNumber: String?
    var tip: String?
    
    
    // MARK: - UI
    private lazy var topStackView: UIStackView = {
        let element = UIStackView()
        element.alignment = .center
        element.distribution = .fillEqually
        element.spacing = 15
        element.axis = .vertical

        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var topTitleLabel = UILabel(textColor: .lightGray, fontSize: 25, alignment: .center)
    private lazy var topResultLabel = UILabel(textColor: greenColor, fontSize: 50, alignment: .center)
    
    private lazy var descriptionLabel = UILabel(textColor: .lightGray, fontSize: 20, alignment: .center)
    
    private lazy var backgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 0.78, green: 0.94, blue: 0.89, alpha: 1)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var reCalculateButton: UIButton = {
        let element = UIButton(type: .system)
        
        element.backgroundColor = greenColor
        element.tintColor = .white
        element.layer.cornerRadius = 10
        element.titleLabel?.font = .systemFont(ofSize: 30)
        element.setTitle("Recalculate", for: .normal)
        element.addTarget(self, action: #selector(reCalculatePressed), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    @objc private func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraint()
    }
}

extension ResultViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        view.addSubview(topStackView)
        view.addSubview(reCalculateButton)
        view.addSubview(descriptionLabel)
        
        
        topStackView.addArrangedSubview(topTitleLabel)
        topStackView.addArrangedSubview(topResultLabel)
        
        topTitleLabel.text = "Total per person"
        topResultLabel.text = result
        descriptionLabel.text = "Split between \(peopleNumber ?? "") people, with \(tip ?? "")% tip."
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
        
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            reCalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            reCalculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            reCalculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            descriptionLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 60),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
        ])
    }
    
}
