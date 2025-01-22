import Foundation


protocol TipsCalculationModelDelegate: AnyObject {
    func didFinishCalculating(_ result: String)
}

final class TipsCalculationModel {
    
    private let tipsArray = ["5%", "10%", "15%", "20%"]
    private var bill: Double = 0
    private var tips: Double = 0
    private var personCount: Double = 1
    
    weak var delegate: TipsCalculationModelDelegate?
    
    func updateBill(with bill: Double) {
        self.bill = bill
    }
    
    func updateTips(with tips: Double) {
        self.tips = tips
    }
    
    func updatePersonCount(with count: Double) {
        self.personCount = count
    }
    
    func getTipsArray() -> [String] {
        return tipsArray
    }
    
    func calculateTips() -> String {
        let result = (bill * tips) / 100 / personCount
        let formattedResult = formatNumberWithThousandSeparator(result)
        self.delegate?.didFinishCalculating(formattedResult)
        return formattedResult
    }
    
    private func formatNumberWithThousandSeparator(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSize = 3
        formatter.minimumFractionDigits = 0  // Минимум 0 знаков после запятой
        formatter.maximumFractionDigits = 2  // Максимум 2 знака после запятой
        formatter.groupingSeparator = ","
        
        let formattedNumber = formatter.string(from: NSNumber(value: number)) ?? "\(number)"
        return formattedNumber
    }
}
