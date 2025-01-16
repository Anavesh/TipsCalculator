import UIKit

final class TipsCalculationVC: UIViewController {
    
    // MARK: - Variables and Constants
    
    private var tips: Double = 0 {
        didSet { tipsCalculationModel.tips = tips }
    }
    private var personCount: Double = 1  {
        didSet {
            tipsCalculationModel.personCount = personCount
            personsView.personCountLabel.text = "\(personCount)"
        }
    }
    private var totalBill: Double = 0 {
        didSet {
            tipsCalculationModel.bill = totalBill
        }
    }
    
    private var tipsArray: [String] {
        return tipsCalculationModel.tipsArray
    }
    
    // MARK: - Views and Model
    private let (headView, totalBillView, personsView, tipsViewWithAction) = {
        return (HeadView(), TotalBillView(), PersonsView(), TipsViewWithAction())
    }()
    private var tipsCalculationModel = TipsCalculationModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActionsAndDelegates()
    }
    
    // MARK: - Setup Methods
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        [headView,totalBillView,personsView,tipsViewWithAction].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        // Set constraints for each view
        let isLargeDevice = UIScreen.main.bounds.width > 768
        NSLayoutConstraint.activate([

            // headView constraints
            headView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: isLargeDevice ? 6 : 2),
            headView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: isLargeDevice ? 24 : 12),
            headView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: isLargeDevice ? -24 : -12),
            headView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            // totalBillView constraints
            totalBillView.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: isLargeDevice ? 12 : 2),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: isLargeDevice ? 32 : 12),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: isLargeDevice ? -16 : -12),
            totalBillView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: isLargeDevice ? 0.12 : 0.12),
            
            // personsView constraints
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: isLargeDevice ? 12 : 16),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: isLargeDevice ? 32 : 12),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: isLargeDevice ? -16 : -12),
            personsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: isLargeDevice ? 0.12 : 0.12),
            
            // tipsViewWithAction constraints
            tipsViewWithAction.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: isLargeDevice ? 12 : 4),
            tipsViewWithAction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: isLargeDevice ? 32 : 12),
            tipsViewWithAction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: isLargeDevice ? -16 : -12),
            tipsViewWithAction.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: isLargeDevice ? 0.28 : 0.24)
        ])
    }
    
    private func setupActionsAndDelegates() {
        setupButtonActions()
        setupCollectionView()
        createDismissKeyBoardTapGesture()
        totalBillView.totalBillTextField.delegate = self
    }
    
    private func setupButtonActions() {
        personsView.personIncreaseButton.addTarget(self, action: #selector(increasePersonCount), for: .touchUpInside)
        personsView.personDecreaseButton.addTarget(self, action: #selector(decreasePersonCount), for: .touchUpInside)
        tipsViewWithAction.calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    
    private func setupCollectionView() {
        tipsViewWithAction.tipsCollection.delegate = self
        tipsViewWithAction.tipsCollection.dataSource = self
        tipsViewWithAction.tipsCollection.allowsSelection = true
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
    }
    
    @objc private func decreasePersonCount() {
        guard personCount > 1 else { return }
        personCount -= 1
    }
    
    @objc private func calculateButtonTapped() {
        let result = tipsCalculationModel.calculateTips()
        presentTCAlertOnMainThread(title: "Your tips", message: "\(result)/person")
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension TipsCalculationVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipsViewCollectionCell.identifier, for: indexPath) as? TipsViewCollectionCell else {
            fatalError("Unable to dequeue TipsViewCollectionCell")
        }
        let tipsArray = tipsCalculationModel.tipsArray
        cell.tipsAmountLabel.text = tipsArray[indexPath.row]
        cell.configureCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tips = Double(tipsArray[indexPath.row]) ?? 0
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

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 5
        return CGSize(width: width, height: width * 0.7)
    }
}

// MARK: - UITextFieldDelegate

extension TipsCalculationVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty, let bill = Double(text) else {
            presentTCAlertOnMainThread(title: "Error", message: "Invalid bill amount")
            totalBill = 0
            return
        }
        totalBill = bill
    }
}

extension UIViewController {
    func presentTCAlertOnMainThread(title: String, message: String) {
        DispatchQueue.main.async {
            let alertVC = TCAlertVC(title: title, message: message)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
