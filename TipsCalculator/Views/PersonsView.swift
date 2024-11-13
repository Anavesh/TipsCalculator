import UIKit

class PersonsView: UIView {
    
// MARK: UI elements
    
    fileprivate let personsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "Persons"
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let personCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Bold", size: 36)
        label.text = "1"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    fileprivate let lightBlueView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5972653031, green: 0.9011378884, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let personIncreaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal) // знак плюса
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 24)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = .init(gray: 20, alpha: 0.5) // задает цвет границы
        button.layer.borderWidth = 1.5 // задает ширину границы кнопки
        button.backgroundColor = #colorLiteral(red: 0.4951053858, green: 0.9051901698, blue: 1, alpha: 0.926919495)
        return button
    }()
    
    let personDecreaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal) // знак минуса
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 24)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = .init(gray: 20, alpha: 0.5)
        button.layer.borderWidth = 1.5
        button.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.9051901698, blue: 1, alpha: 0.7538803808)
        return button
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
    
    fileprivate func setView() {
        [personsLabel, lightBlueView].forEach {$0.translatesAutoresizingMaskIntoConstraints = false; self.addSubview($0)}
        [personDecreaseButton, personIncreaseButton,personCountLabel].forEach {$0.translatesAutoresizingMaskIntoConstraints = false; lightBlueView.addSubview($0)}
    }

    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            personsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            personsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            personsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.19),
            
            lightBlueView.topAnchor.constraint(equalTo: personsLabel.bottomAnchor, constant: 4),
            lightBlueView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lightBlueView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lightBlueView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            
            personIncreaseButton.topAnchor.constraint(equalTo: lightBlueView.topAnchor),
            personIncreaseButton.heightAnchor.constraint(equalTo: lightBlueView.heightAnchor),
            personIncreaseButton.widthAnchor.constraint(equalTo: lightBlueView.widthAnchor, multiplier: 0.2),
            personIncreaseButton.trailingAnchor.constraint(equalTo: lightBlueView.trailingAnchor),
        
            personDecreaseButton.topAnchor.constraint(equalTo: lightBlueView.topAnchor),
            personDecreaseButton.heightAnchor.constraint(equalTo: lightBlueView.heightAnchor),
            personDecreaseButton.widthAnchor.constraint(equalTo: lightBlueView.widthAnchor, multiplier: 0.2),
            personDecreaseButton.leadingAnchor.constraint(equalTo: lightBlueView.leadingAnchor),
            
            personCountLabel.centerXAnchor.constraint(equalTo: lightBlueView.centerXAnchor),
            personCountLabel.centerYAnchor.constraint(equalTo: lightBlueView.centerYAnchor),
        ])
    }
}
