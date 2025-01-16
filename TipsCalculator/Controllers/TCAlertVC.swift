import UIKit

class TCAlertVC: UIViewController {
    
    // MARK: Variables and constants
    
    var alertTitle: String
    var alertMessage: String
    
    init(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: UI elements
    
    let alertView = TCAlertView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConstraints()
        configureActionButton()
        configureAlertViewContent()
    }
    
    // MARK: Set View and Constraints
    private func setView() {
        view.addSubview(alertView)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.layer.cornerRadius = 10
        alertView.layer.borderWidth = 2
        alertView.layer.borderColor = UIColor.white.cgColor
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.widthAnchor.constraint(equalToConstant: 300),
            alertView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    private func configureAlertViewContent() {
        alertView.alertTitleLabel.text = alertTitle
        alertView.alertTextLabel.text = alertMessage
    }
    
    private func configureActionButton() {
        alertView.alertButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
