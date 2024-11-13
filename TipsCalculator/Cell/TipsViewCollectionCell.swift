import UIKit

class TipsViewCollectionCell: UICollectionViewCell {

    // MARK: Variables and Constants

    static let identifier = "TipsCell"

    // MARK: UI elements
    let tipsAmountLabel: UILabel = {
        let button = UILabel()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.text = "0"
        button.textAlignment = .center
        button.font = UIFont(name: "Avenir Next Bold", size: 24)
        button.textColor = .black
        button.minimumScaleFactor = 0.5
        button.adjustsFontSizeToFitWidth = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Set Views and Constraints

    private func setView() {
        addSubview(tipsAmountLabel)
        backgroundColor = #colorLiteral(red: 0.4951053858, green: 0.9051901698, blue: 1, alpha: 0.926919495)
        layer.cornerRadius = 10
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            tipsAmountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            tipsAmountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tipsAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 3),
            tipsAmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3)
        ])
    }

    // MARK: Cell configuration

    public func configureCell() {
        layer.borderWidth = isSelected ? 3 : 0
        layer.borderColor = isSelected ? UIColor.white.cgColor : nil
    }
}
