import UIKit

class CustomButton: UIButton {

    var color: UIColor = .black
    let touchDownAlpha: CGFloat = 0.3
    var flag = false
    var data : String?
    
    weak var timer: Timer?

    func stopTimer() {
        timer?.invalidate()
    }

    deinit {
        stopTimer()
    }

    func setup() {
        backgroundColor = .clear
        layer.backgroundColor = color.withAlphaComponent(0.3).cgColor

        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    convenience init(color: UIColor? = nil, title: String? = nil, data: String?) {
        self.init(type: .custom)

        if let color = color {
            self.color = color
        }

        if let title = title {
            setTitle(title, for: .normal)
            setTitleColor(.black, for: .normal)
        }
        
        self.data = data ?? ""
        

        setup()
    }
    
    func is_selected() -> Bool {
        return flag
    }
    
    func get_data() -> String? {
        return self.data ?? ""
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted && flag == false {
                print("set")
                flag = true
                touchUp()
            } else if isHighlighted && flag == true {
                print("unset")
                flag = false
                cancelTracking(with: nil)
                touchDown()
            }
        }
    }

    func touchDown() {
        stopTimer()

        layer.backgroundColor = color.withAlphaComponent(touchDownAlpha).cgColor
    }

    let timerStep: TimeInterval = 0.01
    let animateTime: TimeInterval = 0.4
    lazy var alphaStep: CGFloat = {
        return (1 - touchDownAlpha) / CGFloat(animateTime / timerStep)
    }()

    func touchUp() {
        timer = Timer.scheduledTimer(timeInterval: timerStep,
                                     target: self,
                                     selector: #selector(animation),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc func animation() {
        guard let backgroundAlpha = layer.backgroundColor?.alpha else {
            stopTimer()

            return
        }

        let newAlpha = backgroundAlpha + alphaStep

        if newAlpha < 1 {
            layer.backgroundColor = color.withAlphaComponent(newAlpha).cgColor
        } else {
            layer.backgroundColor = color.cgColor

            stopTimer()
        }
    }

    
}
