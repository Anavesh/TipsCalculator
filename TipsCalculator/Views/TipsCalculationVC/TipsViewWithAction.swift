import UIKit

final class TipsViewWithAction: UIView {
    
    // MARK: Variables and constants
    let isLargeDevice = UIScreen.main.bounds.width > 768
    
    // MARK: UI Elements

    private let tipsLabel = TCLabel(text: "Tips", fontStyle:.title3, alignment: .left)

    lazy var tipsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = isLargeDevice ? 48 : 24
        layout.minimumInteritemSpacing = isLargeDevice ? 16 : 8
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    let calculateButton = TCButton(text: "Calculate", colour: #colorLiteral(red: 0.2392156863, green: 0.231372549, blue: 0.9529411765, alpha: 0.926919495), cornerRadius: 16)

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup View and Constraints

    private func setupView() {
        [tipsLabel, tipsCollection, calculateButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        tipsCollection.register(
            TipsViewCollectionCell.self,
            forCellWithReuseIdentifier: TipsViewCollectionCell.identifier
        )
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Tips label
            tipsLabel.topAnchor.constraint(equalTo: topAnchor, constant: isLargeDevice ? 16 : 4),
            tipsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            tipsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: isLargeDevice ? 0.5 : 0.25),
            tipsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: isLargeDevice ? 48 : 24),
            
            // Tips collection view
            tipsCollection.topAnchor.constraint(equalTo: tipsLabel.bottomAnchor, constant: isLargeDevice ? 8 : 4),
            tipsCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            tipsCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: isLargeDevice ? -32 : -16),
            tipsCollection.heightAnchor.constraint(equalTo: heightAnchor, multiplier: isLargeDevice ? 0.4 : 0.35),
            
            // Calculate button
            calculateButton.topAnchor.constraint(equalTo: tipsCollection.bottomAnchor, constant: isLargeDevice ? 48 : 28),
            calculateButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: isLargeDevice ? 0.2 : 0.2),
            calculateButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: isLargeDevice ? 0.4 : 0.5),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
