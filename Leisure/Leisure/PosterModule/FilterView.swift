import UIKit
import Kingfisher
import PinLayout

class CustomButton1: UIButton {

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
        layer.backgroundColor = color.cgColor

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
                touchDown()
            } else if isHighlighted && flag == true {
                print("unset")
                flag = false
                cancelTracking(with: nil)
                touchUp()
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




class FilterView: UIView {
    private let presenter: PosterViewOutput
    private let categoriesLabel = UILabel()
    private let containerView = UIView()
    let kidsButton = CustomButton1(color: .orange, title: "kids", data: "kids")
    let festivalButton = CustomButton1(color: .green, title: "festival", data: "festival")
    let holidayButton = CustomButton1(color: .red, title: "holiday", data: "holiday")
    let SubmitButton = UIButton(frame: CGRect(x: 100,
                                               y: 100,
                                               width: 200,
                                               height: 60))
    
   
    init(presenter: PosterViewOutput) {
        self.presenter = presenter
        super.init(frame: UIScreen.main.bounds)
        setup()
        configure()

           return;
       }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        
        containerView.clipsToBounds = true
        SubmitButton.setTitle("Перейти на сайт", for: .normal)
        SubmitButton.setTitleColor(.systemGray6,for: .normal)
        SubmitButton.addTarget(self,action: #selector(SubmitAction),
                         for: .touchUpInside)
        
        SubmitButton.backgroundColor = #colorLiteral(red: 0.4392156899, green:
                                                    0.01176470611, blue: 0.1921568662, alpha: 0.8)
        
        [categoriesLabel, kidsButton, festivalButton, holidayButton, SubmitButton].forEach {
            containerView.addSubview($0)
        }
    
        self.addSubview(containerView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.pin
            .left(15)
            .right(15)
            .top(100)
            .bottom(8)
        
        categoriesLabel.pin
            .size(250)
            .top(5)
            .hCenter()
        
        kidsButton.pin
            .height(50)
            .width(100)
            .below(of:categoriesLabel)
        
        festivalButton.pin
            .height(50)
            .width(100)
            .below(of:kidsButton)
        
        holidayButton.pin
            .height(50)
            .width(100)
            .below(of:festivalButton)
        
        SubmitButton.pin
            .height(50)
            .width(100)
            .below(of:SubmitButton)
        
        
    }
    
    func configure() {
        categoriesLabel.text = " Категории"
    }
    
    @objc
    func SubmitAction() {
        var categories: [String] = []
        if kidsButton.is_selected(){
            categories.append(kidsButton.get_data() ?? "")
        }
        
        if festivalButton.is_selected(){
            categories.append(festivalButton.get_data() ?? "")
        }
        
        if holidayButton.is_selected(){
            categories.append(holidayButton.get_data() ?? "")
        }
        
        
        self.presenter.setCategories(categories: categories)
        print(categories)
        self.presenter.didPullRefresh()
    }
}
