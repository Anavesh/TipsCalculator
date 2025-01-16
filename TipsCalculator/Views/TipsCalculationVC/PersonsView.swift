import UIKit

final class PersonsView: UIView {
    // MARK: UI elements

    private let personsLabel = TCLabel(text: "Persons", fontStyle: .title3, alignment: .left)
    let personCountLabel = TCLabel(text: "1", fontStyle: .title1, alignment: .center)
    let personIncreaseButton = TCButton(text: "+", colour: #colorLiteral(red: 0.2392156863, green: 0.231372549, blue: 0.9529411765, alpha: 0.926919495), cornerRadius: 8)
    let personDecreaseButton = TCButton(text: "-", colour: #colorLiteral(red: 0.2392156863, green: 0.231372549, blue: 0.9529411765, alpha: 0.926919495), cornerRadius: 8)
    
    fileprivate let lightBlueViewWithButtons: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9176470588, blue: 1, alpha: 0.926919495)
        view.layer.cornerRadius = 10
        return view
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

    fileprivate func setView() {
        [personsLabel, lightBlueViewWithButtons].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        [personDecreaseButton, personIncreaseButton, personCountLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            lightBlueViewWithButtons.addSubview($0)
        }
    }

    fileprivate func setConstraints() {
        let isLargeDevice = UIScreen.main.bounds.width > 768

        NSLayoutConstraint.activate([
            // Persons label
            personsLabel.topAnchor.constraint(equalTo: topAnchor, constant: isLargeDevice ? 16 : 4),
            personsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            personsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: isLargeDevice ? 0.5 : 0.25),
            personsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: isLargeDevice ? 48 : 24),

            // Light blue view containing buttons and count label
            lightBlueViewWithButtons.topAnchor.constraint(equalTo: personsLabel.bottomAnchor, constant: isLargeDevice ? 24 : 8),
            lightBlueViewWithButtons.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            lightBlueViewWithButtons.trailingAnchor.constraint(equalTo: trailingAnchor, constant: isLargeDevice ? -32 : -16),
            lightBlueViewWithButtons.heightAnchor.constraint(equalTo: heightAnchor, multiplier: isLargeDevice ? 0.5 : 0.5),

            // Increase button
            personIncreaseButton.topAnchor.constraint(equalTo: lightBlueViewWithButtons.topAnchor),
            personIncreaseButton.heightAnchor.constraint(equalTo: lightBlueViewWithButtons.heightAnchor),
            personIncreaseButton.widthAnchor.constraint(equalTo: lightBlueViewWithButtons.widthAnchor, multiplier: isLargeDevice ? 0.2 : 0.15),
            personIncreaseButton.trailingAnchor.constraint(equalTo: lightBlueViewWithButtons.trailingAnchor),

            // Decrease button
            personDecreaseButton.topAnchor.constraint(equalTo: lightBlueViewWithButtons.topAnchor),
            personDecreaseButton.heightAnchor.constraint(equalTo: lightBlueViewWithButtons.heightAnchor),
            personDecreaseButton.widthAnchor.constraint(equalTo: lightBlueViewWithButtons.widthAnchor, multiplier: isLargeDevice ? 0.2 : 0.15),
            personDecreaseButton.leadingAnchor.constraint(equalTo: lightBlueViewWithButtons.leadingAnchor),

            // Count label
            personCountLabel.centerXAnchor.constraint(equalTo: lightBlueViewWithButtons.centerXAnchor),
            personCountLabel.centerYAnchor.constraint(equalTo: lightBlueViewWithButtons.centerYAnchor),
        ])
    }
}
