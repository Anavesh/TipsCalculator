import UIKit

final class CountryTableViewCell: UITableViewCell {
    
    // MARK: Constants and variables
    
    static let identifier = "CountryCell"
    let flagSize: CGFloat = 40
    let stackSpacing: CGFloat = 16
    let contentPadding: CGFloat = 8
    
    // MARK: UI Elements
    
    private let flagImageView = TCImageView(imageName: "photo")
    private let countryNameLabel = TCLabel(text: "Placeholder", fontStyle: .body, alignment: .left)
    
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [flagImageView, countryNameLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configuration
    func configureCell(with country: CountryTipInfo) {
        flagImageView.image = UIImage(named: country.flagImage)
        countryNameLabel.text = country.name
    }
    
    // MARK: Private Methods
    private func setupView() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ContentStackView Constraints
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentPadding),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: stackSpacing),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -stackSpacing),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentPadding),
            
            // FlagImageView Constraints
            flagImageView.widthAnchor.constraint(equalToConstant: flagSize),
            flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor, multiplier: 0.6)  
        ])
    }
}
