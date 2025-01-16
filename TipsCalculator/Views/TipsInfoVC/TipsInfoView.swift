//
//  TipsInfoView.swift
//  TipsCalculator
//
//  Created by Naira on 10.01.2025.
//

import UIKit

final class TipsInfoView: UIView {
    
    // MARK: UI elements
    
    let countryTitleLabel = TCLabel(text: "Placeholder", fontStyle: .largeTitle, alignment: .center)
    let countryFlagImage = TCImageView(imageName: "photo")
    let tipsInfoTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = Roboto.dynamicType(for: .body)
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setView() {
        self.backgroundColor = .systemBackground
        [countryTitleLabel, countryFlagImage,tipsInfoTextView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        let isLargeDevice = UIScreen.main.bounds.width > 768
        
        NSLayoutConstraint.activate([
            // Заголовок
            countryTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: isLargeDevice ? 32 : 8),
            countryTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countryTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            countryTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: isLargeDevice ? -32 : -16),
            
            // Логотип
            countryFlagImage.topAnchor.constraint(equalTo: countryTitleLabel.bottomAnchor, constant: isLargeDevice ? 24 : 16),
            countryFlagImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            countryFlagImage.heightAnchor.constraint(equalToConstant: 150),
            countryFlagImage.widthAnchor.constraint(equalToConstant: 300),
            
            // Описание
            tipsInfoTextView.topAnchor.constraint(equalTo: countryFlagImage.bottomAnchor, constant: isLargeDevice ? 24 : 16),
            tipsInfoTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            tipsInfoTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: isLargeDevice ? -32 : -16),
            tipsInfoTextView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }

}
