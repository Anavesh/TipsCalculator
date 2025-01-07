import Foundation

struct TipsCalculationModel {
    var bill: Int = 0
    var tips: Int = 0
    var personCount: Int = 0
    
    func calculateTips() -> Int {
        return(bill * tips) / 100 / personCount
    }
}
