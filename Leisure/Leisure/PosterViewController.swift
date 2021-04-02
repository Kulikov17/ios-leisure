//
//  PosterViewController.swift
//  Leisure
//
//  Created by Дмитрий Куликов on 25.03.2021.
//

import UIKit
import PinLayout

class PosterViewController: UIViewController {

    private let tableView = UITableView.init()
    private let entertainments: [Entertainment] = [
        Entertainment(name: "Концерт Bring Me The Horizon",
                type: "Музыка",
                info: """
                29 мая 2021-го года в Москве на арене спортивного комплекса «Мегаспорт» состоится концерт британской рок-группы «Bring Me the Horizon».
                
                Популярность рок-коллектива только набирает обороты, причем не только в родной Великобритании, но и далеко за ее пределами. Не все всегда складывалось в жизни коллектива гладко. Так, образовавшись в команду в 2004-м году, они столкнулись с первыми трудностями – ни одна из уважающих себя студий звукозаписи не взялась записывать их песни.
                Ребята не стали расстраиваться и организовали собственную звукозаписывающую студию и первый мини-альбом, записанный ими под названием «This Is What the Edge of Your Seat Was Made For» принес им заслуженное внимание. Качественный альтернативный рок, металкор, деткор – стили, в которых они пишут музыку.
                В рамках предстоящего концерта фанаты Bring Me the Horizon в России услышат и старые работы рок-группы и новые композиции, в том числе и композиции с нового мини-альбома «Post Human: Survival Horror», увидевшего свет в октябре 2020-го года.
                Скандальные рокеры отправляются в тур в поддержку своих последних пластинок. Не пропустите встречу с ними!
                """,
                imagePath: "bmth",
                cost: 2500),
                    
        Entertainment(name: "Айнбо. Сердце Амазонии",
                type: "Мультфильм",
                info: """
                Бесстрашная Айнбо родилась и выросла в таинственных амазонских джунглях. Узнав, что её родному поселку грозит опасность, наша героиня, дочь вождя, тотчас отправляется за помощью в компании удивительных зверей. Их ждёт восхождение к пылающему вулкану, встреча с могущественным духом Амазонии и схватка с мифическим чудовищем.
                """,
                imagePath: "aibo",
                cost: 900),
                    
        Entertainment(name: "Бэтмен против Брежнева",
                type: "Театр",
                info: """
                Спектакль Денисовой – фантазия о том, как Бэтмен жил бы в эпоху застоя, будь он советским гражданином. «У него была бы семья в виде жены и дочери, которых он очень любит. Терпел бы наезды тещи. Ходил бы на работу в многотиражку Готэма и писал статьи о том, как соцсоревнование вызывает отклик у миллионов советских людей», – комментирует автор спектакля Саша Денисова.
                """,
                imagePath: "bpb",
                cost: 0),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Афиша"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(EntertaimentTableViewCell.self, forCellReuseIdentifier: "EntertaimentTableViewCell")
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.pin.all()
    }
}

extension PosterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entertainments.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntertaimentTableViewCell", for: indexPath) as? EntertaimentTableViewCell else {
            return .init()
            }
        
        cell.layer.cornerRadius=10
    
        cell.configure(with: entertainments[indexPath.row])
   
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let cityViewController = MapViewController()
        cityViewController.title = title
        cityViewController.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(cityViewController, animated: true)
    }
}

