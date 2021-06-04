import UIKit
import Kingfisher
import PinLayout

class FilterView: UIView {
    private let presenter: PosterViewOutput
    private let categoriesLabel = UILabel()
    private let containerView = UIView()
    
    let businessEventsButton = CustomButton(color: .green, title: "События для бизнеса", data: "business-events")
    let concertButton = CustomButton(color: .blue, title: "Концерты", data: "concert")
    let cinemaButton = CustomButton(color: .yellow, title: "Кино", data: "cinema")
    let educationButton = CustomButton(color: .purple, title: "Обучение", data: "education")
    let entertainmentButton = CustomButton(color: .orange, title: "Развлечения", data: "entertainment")
    let kidsButton = CustomButton(color: .magenta, title: "Детям", data: "kids")
    let holidayButton = CustomButton(color: .red, title: "Праздники", data: "holiday")
    let exhibitionButton = CustomButton(color: .yellow, title: "Выставки", data: "exhibition")
    let fashionButton = CustomButton(color: .green, title: "Мода и стиль", data: "fashion")
    let festivalButton = CustomButton(color: .blue, title: "Фестивали", data: "festival")
    let otherButton = CustomButton(color: .magenta, title: "Разное", data: "other")
    let partyButton = CustomButton(color: .red, title: "Вечеринки", data: "party")
    let photoButton = CustomButton(color: .yellow, title: "Фотография", data: "photo")
    let questButton = CustomButton(color: .red, title: "Квесты", data: "quest")
    let recreationButton = CustomButton(color: .blue, title: "Отдых", data: "recreation")
    let shoppingButton = CustomButton(color: .purple, title: "Шопинг", data: "shopping")
    let socialActivityButton = CustomButton(color: .orange, title: "Благотворительность", data: "social-activity")
    let theaterButton = CustomButton(color: .magenta, title: "Спектакли", data: "theater")
    let tourButton = CustomButton(color: .red, title: "Экскурсии", data: "tour")
    let yarmarkiRazvlecheniyaYarmarkiButton = CustomButton(color: .green, title: "Ярмарки", data: "yarmarki-razvlecheniya-yarmarki")
    
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
        SubmitButton.setTitle("Применить", for: .normal)
        SubmitButton.setTitleColor(.systemGray6,for: .normal)
        SubmitButton.addTarget(self,action: #selector(SubmitAction),
                         for: .touchUpInside)

        SubmitButton.backgroundColor = #colorLiteral(red: 0.4392156899, green:
                                                    0.01176470611, blue: 0.1921568662, alpha: 0.8)
        
        [categoriesLabel, businessEventsButton, concertButton, cinemaButton, kidsButton,
        entertainmentButton, educationButton, holidayButton, exhibitionButton,
        fashionButton, festivalButton, otherButton, partyButton, photoButton, questButton,
        recreationButton, socialActivityButton, theaterButton, shoppingButton, tourButton,
        yarmarkiRazvlecheniyaYarmarkiButton, SubmitButton].forEach {
            containerView.addSubview($0)
        }
    
        self.addSubview(containerView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.pin
            .left(pin.safeArea)
            .right(pin.safeArea)
            .top(pin.safeArea)
            .bottom(pin.safeArea)
        
        categoriesLabel.pin
            .size(90)
            .hCenter()
        
        SubmitButton.pin
            .height(30)
            .width(130)
            .topRight()
            
        businessEventsButton.pin
            .below(of: categoriesLabel)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .size(200)
            .sizeToFit(.width)
        
        concertButton.pin
            .width(110)
            .top(pin.safeArea)
            .after(of: businessEventsButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
        
        cinemaButton.pin
            .width(90)
            .top(pin.safeArea)
            .after(of: concertButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
        
        kidsButton.pin
            .below(of: businessEventsButton)
            .marginTop(10)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .size(100)
            .sizeToFit(.width)
        
        entertainmentButton.pin
            .width(150)
            .after(of: kidsButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: concertButton)
            .marginTop(10)
        
        educationButton.pin
            .width(150)
            .after(of: entertainmentButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: cinemaButton)
            .marginTop(10)
        
        holidayButton.pin
            .below(of: kidsButton)
            .marginTop(10)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .size(135)
            .sizeToFit(.width)
        
        exhibitionButton.pin
            .width(130)
            .after(of: holidayButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: entertainmentButton)
            .marginTop(10)
        
        fashionButton.pin
            .width(135)
            .after(of: exhibitionButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: entertainmentButton)
            .marginTop(10)
        
        festivalButton.pin
            .below(of: holidayButton)
            .marginTop(10)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .size(135)
            .sizeToFit(.width)
        
        otherButton.pin
            .width(130)
            .after(of: festivalButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: exhibitionButton)
            .marginTop(10)
        
        partyButton.pin
            .width(135)
            .after(of: otherButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: fashionButton)
            .marginTop(10)
        
        photoButton.pin
            .below(of: festivalButton)
            .marginTop(10)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .size(150)
            .sizeToFit(.width)
        
        questButton.pin
            .width(120)
            .after(of: photoButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: otherButton)
            .marginTop(10)
        
        recreationButton.pin
            .width(135)
            .after(of: questButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: partyButton)
            .marginTop(10)
        
        socialActivityButton.pin
            .below(of: photoButton)
            .marginTop(10)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .size(250)
            .sizeToFit(.width)
        
        theaterButton.pin
            .width(170)
            .after(of: socialActivityButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of: questButton)
            .marginTop(10)
        
        shoppingButton.pin
            .below(of: socialActivityButton)
            .marginTop(10)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .size(150)
            .sizeToFit(.width)
        
        tourButton.pin
            .width(130)
            .after(of: shoppingButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of:socialActivityButton)
            .marginTop(10)
        
        yarmarkiRazvlecheniyaYarmarkiButton.pin
            .width(130)
            .after(of: tourButton)
            .marginLeft(15)
            .right(pin.safeArea)
            .sizeToFit(.width)
            .below(of:theaterButton)
            .marginTop(10)
        
    }
    
    func configure() {
        categoriesLabel.text = "Категории"
    }
    
    @objc
    func SubmitAction() {
        var categories: [String] = []
        let buttons: [CustomButton] = [businessEventsButton, concertButton, cinemaButton, kidsButton,
        entertainmentButton, educationButton, holidayButton, exhibitionButton,
        fashionButton, festivalButton, otherButton, partyButton, photoButton, questButton,
        recreationButton, socialActivityButton, theaterButton, shoppingButton, tourButton,
        yarmarkiRazvlecheniyaYarmarkiButton]
        
        for button in buttons{
            if button.is_selected(){
                categories.append(button.get_data() ?? "")
            }
        }
        self.presenter.setCategories(categories: categories)
        //print(categories)
        self.presenter.didPullRefresh()
    }
}
