//
//  CTAlertVC.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit

class CTAlertVC: UIViewController {
    
    let alertContainerView = CAAlertContainerView(frame: .zero)
    let titleLabel = CTTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = CTBodyLabel(textAlignment: .center)
    let actionButton = CTButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle: String?
    var alertMessage: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(alertTitle: String, alertMessage: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self .alertMessage = alertMessage
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(alertContainerView)
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(actionButton)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureAlertContainerView()
        configureTitleLabel()
                configureActionButton()
        configureBodyLabel()
    }
    
    func configureAlertContainerView(){
        NSLayoutConstraint.activate([
            alertContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertContainerView.widthAnchor.constraint(equalToConstant: 280),
            alertContainerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel(){
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: alertContainerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: alertContainerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: alertContainerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton(){
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: alertContainerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: alertContainerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: alertContainerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureBodyLabel(){
        messageLabel.text = alertMessage ?? "Unable to complete requset"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: alertContainerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: alertContainerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissVC(){
        self.dismiss(animated: true)
    }

}
