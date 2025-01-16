//
//  TipsInfoVC.swift
//  TipsCalculator
//
//  Created by Naira on 07.01.2025.
//

import UIKit

final class CountryListVC: UIViewController {
    
    // MARK: Variables
    
    private lazy var countries: [CountryTipInfo] = loadFromJSONFile() ?? []
    
    
    // MARK: UI elements
    
    private lazy var countryTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.frame = view.bounds
        return tableView
    }()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setView()
    }
    
    private func setView() {
        view.backgroundColor = .systemBackground
        view.addSubview(countryTableView)
    }
    
    private func setTableView() {
        countryTableView.delegate = self
        countryTableView.dataSource = self
        countryTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
    }
    
    private func loadFromJSONFile() -> [CountryTipInfo]? {
        guard let url = Bundle.main.url(forResource: "TipsData", withExtension: "json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let countries = try JSONDecoder().decode([CountryTipInfo].self, from: data)
            return countries
        } catch {
            print("Error loading or decoding JSON: \(error)")
            return nil
        }
    }

}
extension CountryListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier, for: indexPath)
                as? CountryTableViewCell else { return UITableViewCell()}
        cell.configureCell(with: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = TipsInfoVC(country: countries[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}
