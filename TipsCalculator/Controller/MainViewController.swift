import UIKit

class MainViewController: UIViewController {

    // MARK: Variables and Constants
    
    private var tipsArray = ["10%", "15%", "20%", "25%"]
    private var tips: Int = 0 {
        didSet {
            tipsCalculationModel.tips = tips
        }
    }

    private var personCount: Int = 1 {
        didSet {
            tipsCalculationModel.personCount = personCount
            personsView.personCountLabel.text = "\(personCount)"
        }
    }
    private var totalBill: Int = 0 {
        didSet {
            tipsCalculationModel.bill = totalBill
        }
    }

    // MARK: Views and Model

    let headView = HeadView()
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    let calculateButtonView = CalculateButtonView()
    lazy var tipsCalculationModel = TipsCalculationModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: Set Views and Constraints

    private func configureView() {
        setupView()
        setupConstraints()
        setupActionsAndDelegates()
    }

    private func setupView() {
        view.backgroundColor = .white
        [headView, totalBillView, personsView, tipsView, calculateButtonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        func addConstraints(to view: UIView, topAnchor: NSLayoutYAxisAnchor, topConstant: CGFloat, heightMultiplier: CGFloat, widthMultiplier: CGFloat) {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor, constant: topConstant),
                view.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: heightMultiplier),
                view.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: widthMultiplier),
                view.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
            ])
        }

        addConstraints(to: headView, topAnchor: safeArea.topAnchor, topConstant: 8, heightMultiplier: 0.34, widthMultiplier: 0.8)
        addConstraints(to: totalBillView, topAnchor: headView.bottomAnchor, topConstant: 8, heightMultiplier: 0.1, widthMultiplier: 0.8)
        addConstraints(to: personsView, topAnchor: totalBillView.bottomAnchor, topConstant: 8, heightMultiplier: 0.1, widthMultiplier: 0.8)
        addConstraints(to: tipsView, topAnchor: personsView.bottomAnchor, topConstant: 16, heightMultiplier: 0.16, widthMultiplier: 0.8)
        addConstraints(to: calculateButtonView, topAnchor: tipsView.bottomAnchor, topConstant: 20, heightMultiplier: 0.08, widthMultiplier: 0.6)
    }
}

// MARK: Collection View Setup

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tips = (indexPath.row + 1) * 5 + 5
        if let cell = collectionView.cellForItem(at: indexPath) as? TipsViewCollectionCell {
            cell.isSelected = true
            cell.configureCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TipsViewCollectionCell {
            cell.isSelected = false
            cell.configureCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tipsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipsViewCollectionCell.identifier, for: indexPath) as? TipsViewCollectionCell else {
            assertionFailure("Unable to dequeue TipsViewCollectionCell")
            return UICollectionViewCell()
        }
        cell.tipsAmountLabel.text = tipsArray[indexPath.row]
        cell.configureCell()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 5, height: collectionView.frame.width / 6.5)
    }

    private func setCollectionViewDelegates() {
        tipsView.tipsCollection.delegate = self
        tipsView.tipsCollection.dataSource = self
        tipsView.tipsCollection.allowsSelection = true
    }
}

// MARK: Setup button actions and alert

extension MainViewController {

    private func setupActionsAndDelegates() {
        setupButtonActions()
        setGestureRecognizer()
        setCollectionViewDelegates()
    }

    private func setupButtonActions() {
        personsView.personIncreaseButton.addTarget(self, action: #selector(increasePersonCount), for: .touchUpInside)
        personsView.personDecreaseButton.addTarget(self, action: #selector(decreasePersonCount), for: .touchUpInside)
        calculateButtonView.calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }

    @objc private func increasePersonCount() {
        personCount += 1
    }

    @objc private func decreasePersonCount() {
        if personCount > 1 {
            personCount -= 1
        }
    }

    @objc private func calculateButtonTapped() {
        let result = String(tipsCalculationModel.calculateTips())
        showAlert(withResult: result)
    }

    private func showAlert(withResult result: String) {
        let alertController = UIAlertController(title: "Tips per person", message: result, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertController, animated: true)
    }
}

// MARK: Text Field Delegate

extension MainViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let bill = Int(text) else {
            showAlert(withResult: "Invalid bill amount")
            totalBill = 0
            return
        }
        totalBill = bill
    }

    private func setGestureRecognizer() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }

    @objc private func hideKeyboard() {
        totalBillView.totaBillTextField.resignFirstResponder()
    }
}
