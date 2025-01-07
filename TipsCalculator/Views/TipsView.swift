import UIKit

final class TipsView: UIView {
    // MARK: UI elements

    private let tipsLabel: UILabel = {
        let label = UILabel()
        label.text = "Tips"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()

    let tipsCollection: UICollectionView = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Set View and Constraints

    private func setView() {
        [tipsLabel, tipsCollection].forEach { $0.translatesAutoresizingMaskIntoConstraints = false; self.addSubview($0) }
        tipsCollection.register(TipsViewCollectionCell.self, forCellWithReuseIdentifier: TipsViewCollectionCell.identifier)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            // Tips label constraints
            tipsLabel.topAnchor.constraint(equalTo: topAnchor),
            tipsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            tipsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),

            // Tips collection constraints
            tipsCollection.topAnchor.constraint(equalTo: tipsLabel.bottomAnchor, constant: 4),
            tipsCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            tipsCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            tipsCollection.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            tipsCollection.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}
