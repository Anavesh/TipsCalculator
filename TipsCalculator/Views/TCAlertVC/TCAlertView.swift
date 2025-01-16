
import UIKit

final class TCAlertView: UIView {
    
    // MARK: UI elements
    
    let alertTitleLabel = TCLabel(text: "placeholder", fontStyle: .title3, alignment: .center)
    let alertButton = TCButton(text: "Ok", colour: #colorLiteral(red: 0.2392156863, green: 0.231372549, blue: 0.9529411765, alpha: 0.926919495), cornerRadius: 16)
    let alertTextLabel: UILabel = {
        let label = UILabel()
        label.font = Roboto.dynamicType(for: .body)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "placeholder"
        return label
    }()
    
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setView() {
        self.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9176470588, blue: 1, alpha: 0.926919495)
        [alertTitleLabel, alertTextLabel,alertButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview($0)
        }
    }
    
    private func setConstraints() {
        let isLargeDevice = UIScreen.main.bounds.width > 768
        NSLayoutConstraint.activate([
            
            // Title label
            alertTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: isLargeDevice ? 12 : 8),
            alertTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: isLargeDevice ? 36 : 20),
            alertTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: isLargeDevice ? -36 : -20),
            alertTitleLabel.heightAnchor.constraint(equalToConstant: isLargeDevice ? 32 : 20),
                        
            // Body label
            alertTextLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor, constant: isLargeDevice ? 24 : 16),
            alertTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: isLargeDevice ? 36 : 20),
            alertTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: isLargeDevice ? -36 : -20),
            alertTextLabel.heightAnchor.constraint(equalToConstant: isLargeDevice ? 112 : 84),
                        
            // Action button
            alertButton.topAnchor.constraint(equalTo: alertTextLabel.bottomAnchor, constant: isLargeDevice ? 24 : 16),
            alertButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: isLargeDevice ? 84 : 60),
            alertButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: isLargeDevice ? -84 : -60),
            alertButton.heightAnchor.constraint(equalToConstant: isLargeDevice ? 64 : 44)
        ])
    }
}
