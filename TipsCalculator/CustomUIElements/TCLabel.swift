
import UIKit

final class TCLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(text: String, fontStyle: UIFont.TextStyle, alignment: NSTextAlignment) {
        super.init(frame:.zero)
        self.text = text
        self.textAlignment = alignment
        self.font = Roboto.dynamicType(for: fontStyle)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        adjustsFontSizeToFitWidth = true
        textColor = .black
        adjustsFontForContentSizeCategory = true
    }
}
