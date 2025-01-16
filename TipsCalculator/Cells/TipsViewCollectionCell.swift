import UIKit

final class TipsViewCollectionCell: UICollectionViewCell {
    
    // MARK: Variables and Constants

    static let identifier = "TipsCell"

    // MARK: UI elements
    
    let tipsAmountLabel = TCLabel(text: "0", fontStyle: .title3, alignment: .center)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Set Views and Constraints

    private func setView() {
        addSubview(tipsAmountLabel)
        tipsAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        tipsAmountLabel.textColor = .white
        backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.231372549, blue: 0.9529411765, alpha: 0.926919495)
        layer.cornerRadius = 10
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            tipsAmountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            tipsAmountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tipsAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            tipsAmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
        ])
    }

    // MARK: Cell configuration

    public func configureCell() {
        if isSelected {
            layer.borderWidth = 3
            layer.borderColor = #colorLiteral(red: 1, green: 0.1607843137, blue: 0.1607843137, alpha: 1)
        } else {
            layer.borderWidth = 0
            layer.borderColor = nil
        }
    }
}
