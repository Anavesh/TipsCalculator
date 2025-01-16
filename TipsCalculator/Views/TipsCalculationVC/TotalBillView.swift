import UIKit

final class TotalBillView: UIView {
    // MARK: UI elements
    
    private let totalBillLabel = TCLabel(text: "Total bill", fontStyle: .title3, alignment: .left)
    
    let totalBillTextField: UITextField = {
        let textField = UITextField()
        textField.font = Roboto.dynamicType(for: .title1)
        textField.textColor = .black
        textField.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9176470588, blue: 1, alpha: 1)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.tintColor = .black
        textField.text = ""
        textField.adjustsFontForContentSizeCategory = true
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set Views and Constraints
    
    private func setupView() {
        [totalBillLabel, totalBillTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        let isLargeDevice = UIScreen.main.bounds.width > 768

        NSLayoutConstraint.activate([
            // Метка "Total bill"
            totalBillLabel.topAnchor.constraint(equalTo: topAnchor, constant: isLargeDevice ? 32 : 16),
            totalBillLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            totalBillLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: isLargeDevice ? 0.4 : 0.25),
            totalBillLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: isLargeDevice ? 48 : 24),
            
            // Поле для ввода суммы
            totalBillTextField.topAnchor.constraint(equalTo: totalBillLabel.bottomAnchor, constant: isLargeDevice ? 24 : 16),
            totalBillTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: isLargeDevice ? 32 : 16),
            totalBillTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: isLargeDevice ? -32 : -16),
            totalBillTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: isLargeDevice ? 0.45 : 0.5)
        ])
    }
}
