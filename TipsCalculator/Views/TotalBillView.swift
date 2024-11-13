import UIKit

class TotalBillView: UIView {

// MARK: UI elements
    fileprivate let totalBillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "Total bill"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    let totaBillTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir Next Bold", size: 36)
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 0.597, green: 0.901, blue: 1, alpha: 1)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.tintColor = .black
        textField.text = ""
        return textField
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
        [totalBillLabel, totaBillTextField].forEach {$0.translatesAutoresizingMaskIntoConstraints = false; self.addSubview($0)}
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            totalBillLabel.topAnchor.constraint(equalTo: topAnchor),
            totalBillLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            totalBillLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.19),

            totaBillTextField.topAnchor.constraint(equalTo: totalBillLabel.bottomAnchor, constant: 4),
            totaBillTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            totaBillTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            totaBillTextField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
