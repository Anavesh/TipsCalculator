import UIKit

final class CalculateButtonView: UIView {
    // MARK: Variables

    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 24)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = .init(gray: 20, alpha: 0.5) // задает цвет границы
        button.layer.borderWidth = 1.5 // задает ширину границы кнопки
        button.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.7803921569, blue: 0.05882352941, alpha: 1)
        button.layer.cornerRadius = 20
        return button
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

    // MARK: UI setup

    fileprivate func setView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(calculateButton)
    }

    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: topAnchor),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            calculateButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
        ])
    }
}
