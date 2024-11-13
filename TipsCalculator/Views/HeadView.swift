import UIKit

class HeadView: UIView {
    
    fileprivate let headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tips Calculator"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 36)
        label.minimumScaleFactor = 0.3
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    fileprivate let logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pig")
        image.contentMode = .scaleAspectFit
        return image
    }()

    fileprivate let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter the amount of invoice and number of persons. Press \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setView() {
        [headingLabel, logoImage, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview($0)
        }
    }

    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            headingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            headingLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            headingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            logoImage.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 4),
            logoImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            logoImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }
}
