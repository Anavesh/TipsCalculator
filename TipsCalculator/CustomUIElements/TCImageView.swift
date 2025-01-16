//
//  TCImageView.swift
//  TipsCalculator
//
//  Created by Naira on 15.01.2025.
//

import UIKit

class TCImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(imageName: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
    }
}
