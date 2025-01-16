import UIKit

final class HeadView: UIView {
    
    // MARK: UI elements
    private let headingLabel = TCLabel(text: "Tips Calculator", fontStyle: .largeTitle, alignment: .center)
    private let logoImage = TCImageView(imageName: "pig")
    private let descriptionLabel = TCLabel(text: "Enter the amount, people, and tips, then tap \"Calculate\"",
                                                fontStyle: .title3,
                                                alignment: .center)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        descriptionLabel.numberOfLines = 2 // Надо подумать, наверное, о том, что сделать uitextview?
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        [headingLabel, logoImage, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        let isLargeDevice = UIScreen.main.bounds.width > 768
        
        NSLayoutConstraint.activate([
            // Заголовок
            headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: isLargeDevice ? 32 : 8),
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            headingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: isLargeDevice ? -32 : -16),

            // Логотип
            logoImage.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: isLargeDevice ? 48 : 24),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: isLargeDevice ? 0.2 : 0.25),
            logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor),

            // Описание
            descriptionLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: isLargeDevice ? 24 : 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: isLargeDevice ? -32 : -16),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: isLargeDevice ? -32 : -16)
        ])
    }
}
