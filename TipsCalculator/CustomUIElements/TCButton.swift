
import UIKit

final class TCButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(text: String, colour: UIColor, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        backgroundColor = colour
        layer.cornerRadius = cornerRadius
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        tintColor = .black
        titleLabel?.font = Roboto.dynamicType(for: .title3)
        titleLabel?.adjustsFontForContentSizeCategory = true
        setTitleColor(.white, for: .normal)
    }
}
