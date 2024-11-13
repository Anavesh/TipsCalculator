import Foundation

struct TipsCalculationModel {
    var bill: Int = 0
    var tips: Int = 0
    var personCount: Int = 0

    func calculateTips() -> Int {
        let tipsPerCheque = bill*tips/100
        let tipsPerPerson = tipsPerCheque/personCount
        return tipsPerPerson
    }
}
