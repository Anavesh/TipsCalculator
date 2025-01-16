import Foundation

struct TipsCalculationModel {
    
    let tipsArray = ["5%", "10%", "15%", "20%"]
    var bill: Double = 0
    var tips: Double = 0
    var personCount: Double = 0
    
    func calculateTips() -> String {
        guard personCount > 0 else {
            return "Invalid number of persons"
        }
        let result = (bill * tips) / 100 / personCount
        return formatNumberWithThousandSeparator(result)
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
