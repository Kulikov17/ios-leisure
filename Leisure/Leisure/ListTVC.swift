//
//  ListTVC.swift
//  TableViewTest
//
//  Created by LyubaxaPro on 21.03.2021.
//

import UIKit

class ListTVC: UITableViewController {
    
    var  entertainments = [Entertainment]()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        entertainments += [
        Entertainment(name: "Концерт Bring Me The Horizon",
        type: "Музыка",
        info: """
        29 мая 2021-го года в Москве на арене спортивного комплекса «Мегаспорт» состоится концерт британской рок-группы «Bring Me the Horizon».
        
        Популярность рок-коллектива только набирает обороты, причем не только в родной Великобритании, но и далеко за ее пределами. Не все всегда складывалось в жизни коллектива гладко. Так, образовавшись в команду в 2004-м году, они столкнулись с первыми трудностями – ни одна из уважающих себя студий звукозаписи не взялась записывать их песни.

        Ребята не стали расстраиваться и организовали собственную звукозаписывающую студию и первый мини-альбом, записанный ими под названием «This Is What the Edge of Your Seat Was Made For» принес им заслуженное внимание. Качественный альтернативный рок, металкор, деткор – стили, в которых они пишут музыку.

        В рамках предстоящего концерта фанаты Bring Me the Horizon в России услышат и старые работы рок-группы и новые композиции, в том числе и композиции с нового мини-альбома «Post Human: Survival Horror», увидевшего свет в октябре 2020-го года.

        Скандальные рокеры отправляются в тур в поддержку своих последних пластинок. Не пропустите встречу с ними!
        """,
        imagePath: "bmth"),
            
        Entertainment(name: "Айнбо. Сердце Амазонии",
        type: "Мультфильм",
        info: """
        Бесстрашная Айнбо родилась и выросла в таинственных амазонских джунглях. Узнав, что её родному поселку грозит опасность, наша героиня, дочь вождя, тотчас отправляется за помощью в компании удивительных зверей. Их ждёт восхождение к пылающему вулкану, встреча с могущественным духом Амазонии и схватка с мифическим чудовищем.
        """,
        imagePath: "aibo"),
            
        Entertainment(name: "Бэтмен против Брежнева",
        type: "Театр",
        info: """
        Спектакль Денисовой – фантазия о том, как Бэтмен жил бы в эпоху застоя, будь он советским гражданином. «У него была бы семья в виде жены и дочери, которых он очень любит. Терпел бы наезды тещи. Ходил бы на работу в многотиражку Готэма и писал статьи о том, как соцсоревнование вызывает отклик у миллионов советских людей», – комментирует автор спектакля Саша Денисова.
        """,
        imagePath: "bpb"),
        ]

        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    //запрашивает количество секций, которые должны быть отображены;
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC

        let el = self.entertainments[indexPath.row]

        //detailVC.entertainment = el
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
//    if segue.identifier == "goDetail"
//    {
//        // Здесь объектом sender является ячейка, на которую нажимает юзер
//        // Получаем indexPath выбранной ячейки с помощью метода indexPathForCell:
//        let indexPath = self.tableView.indexPath(for: (sender as! UITableViewCell))
//        let el = self.entertainments[indexPath!.row]
//        let detailVC: DetailVC = segue.destination as! DetailVC
//        detailVC.entertainment = el
//    }

    //запрашивает количество ячеек, которые должны отображаться у каждой секции;
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entertainments.count
    }

    // запрашивает саму ячейку, для конкретной секции.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Инициализируем объект ячейки с идентификатором "Cell"
        // Это тот самый идентификатор, который мы задали ячейке в сториборде
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Получаем объект под индексом равным значению indexPath.row
        let el: Entertainment = self.entertainments[indexPath.row]
        
        cell.imageView?.image = el.getImage()
        cell.textLabel?.text = el.name
        cell.detailTextLabel?.text = el.type
        
        return cell
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}



