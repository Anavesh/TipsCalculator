//
//  TipsInfoVC.swift
//  TipsCalculator
//
//  Created by Naira on 09.01.2025.
//

import UIKit

final class TipsInfoVC: UIViewController {
   
    // MARK: Variables and constants
    
    let tipsInfo: CountryTipInfo
    
    
    // MARK: UI elements
    let tipsInfoView = TipsInfoView()
    
    init(country: CountryTipInfo) {
        self.tipsInfo = country
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConstraints()
        configureTipsInfoView(with: tipsInfo)
    }
    
    private func setView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tipsInfoView)
        tipsInfoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tipsInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tipsInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tipsInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tipsInfoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureTipsInfoView(with country: CountryTipInfo) {
        tipsInfoView.countryTitleLabel.text = country.name
        tipsInfoView.countryFlagImage.image = UIImage(named: country.flagImage)
        tipsInfoView.tipsInfoTextView.text = country.details
    }
    
}
