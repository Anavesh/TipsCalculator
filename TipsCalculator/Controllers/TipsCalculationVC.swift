import UIKit

final class TipsCalculationVC: UIViewController {
    
    // MARK: - Variables and Constants
    
    private let tipsArray = ["10%", "15%", "20%", "25%"]
    private var tips: Int = 0 {
        didSet { tipsCalculationModel.tips = tips }
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
    
    // MARK: - Views and Model
    
    private let headView = HeadView()
    private let totalBillView = TotalBillView()
    private let personsView = PersonsView()
    private let tipsView = TipsView()
    private let calculateButtonView = CalculateButtonView()
    private var tipsCalculationModel = TipsCalculationModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupActionsAndDelegates()
    }
    
    // MARK: - Setup Methods
    
    private func setupView() {
        view.backgroundColor = .white
        [headView, totalBillView, personsView, tipsView, calculateButtonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let views = [headView, totalBillView, personsView, tipsView, calculateButtonView]
        let multipliers: [CGFloat] = [0.34, 0.1, 0.1, 0.16, 0.08]
        let constants: [CGFloat] = [8, 8, 8, 16, 20]
        
        for (index, view) in views.enumerated() {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: index == 0 ? safeArea.topAnchor : views[index - 1].bottomAnchor, constant: constants[index]),
                view.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
                view.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.8),
                view.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: multipliers[index])
            ])
        }
    }
    
    private func setupActionsAndDelegates() {
        setupButtonActions()
        setupCollectionView()
        createDismissKeyBoardTapGesture()
        totalBillView.totaBillTextField.delegate = self
    }
    
    private func setupButtonActions() {
        personsView.personIncreaseButton.addTarget(self, action: #selector(increasePersonCount), for: .touchUpInside)
        personsView.personDecreaseButton.addTarget(self, action: #selector(decreasePersonCount), for: .touchUpInside)
        calculateButtonView.calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    
    private func setupCollectionView() {
        tipsView.tipsCollection.delegate = self
        tipsView.tipsCollection.dataSource = self
        tipsView.tipsCollection.allowsSelection = true
    }
    
    private func createDismissKeyBoardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    
    // MARK: - Actions
    
    @objc private func increasePersonCount() {
        personCount += 1
        print(personCount)
    }
    
    @objc private func decreasePersonCount() {
        guard personCount > 1 else { return }
        personCount -= 1
        print(personCount)
    }
    
    @objc private func calculateButtonTapped() {
        let result = String(tipsCalculationModel.calculateTips())
        showAlert(title: "Tips per person", message: result)
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertController, animated: true)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension TipsCalculationVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipsViewCollectionCell.identifier, for: indexPath) as? TipsViewCollectionCell else {
            fatalError("Unable to dequeue TipsViewCollectionCell")
        }
        cell.tipsAmountLabel.text = tipsArray[indexPath.row]
        cell.configureCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tips = (indexPath.row + 1) * 5 + 5
        print(tips)
        guard let cell = collectionView.cellForItem(at: indexPath) as? TipsViewCollectionCell else { return }
        cell.isSelected = true
        cell.configureCell()
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TipsViewCollectionCell else { return }
        cell.isSelected = false
        cell.configureCell()
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 5
        return CGSize(width: width, height: width * 0.8)
    }
}

// MARK: - UITextFieldDelegate

extension TipsCalculationVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Текстовое поле закончилось редактирование")
        guard let text = textField.text, !text.isEmpty, let bill = Int(text) else {
            showAlert(title: "Error", message: "Invalid bill amount")
            totalBill = 0
            return
        }
        totalBill = bill
    }
}
