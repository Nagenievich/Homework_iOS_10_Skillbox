//
//  ViewController.swift
//  Homework_iOS_10
//
//  Created by Alexey Makarov on 27.04.2021.
//

import UIKit

//table view

struct TableData {
    var title: String
    var icon: String
    var detail: String
    var cellSwitch: String
    
}

struct Section {
    var data = [TableData]()
}

class ViewController: UIViewController {
    
    //table view
    //количество секций
    enum tableSection: Int {
        case main, soundsAndNotification, general
    }
    //элементы секций
    let sec1 = Section(data: [TableData(title: "Авиарежим", icon: "✈️", detail: "", cellSwitch: "&"),
                              TableData(title: "Wi-Fi", icon: "📶", detail: "Anvics", cellSwitch: ""),
                              TableData(title: "Bluetooth", icon: "📳", detail: "Вкл.", cellSwitch: ""),
                              TableData(title: "Сотовая связь", icon: "📶", detail: "", cellSwitch: ""),
                              TableData(title: "Режим модема", icon: "📡", detail: "", cellSwitch: "")])

    let sec2 = Section(data: [TableData(title: "Уведомления", icon: "❗️", detail: "", cellSwitch: ""),
                              TableData(title: "Звуки, тактильные сигналы", icon: "🔈", detail: "", cellSwitch: ""),
                              TableData(title: "Не беспокоить", icon: "🤫", detail: "", cellSwitch: ""),
                              TableData(title: "Экранное время", icon: "📺", detail: "", cellSwitch: "")])

    let sec3 = Section(data: [ TableData(title: "Основные", icon: "⚙️", detail: "🔴", cellSwitch: ""),
                               TableData(title: "Пункт управления", icon: "📱", detail: "", cellSwitch: ""),
                               TableData(title: "Экран и яркость", icon: "📶", detail: "", cellSwitch: ""),
                               TableData(title: "Обои", icon: "🌃", detail: "", cellSwitch: "")])
        
    
    
 
    //collection view
  
    var collectionCellImage = [UIImage(named: "cat1"), UIImage(named: "cat2"),UIImage(named: "cat3"), UIImage(named: "cat4"), UIImage(named: "cat5"), UIImage(named: "cat6")] 
    var collectionCellName = ["Cat 1", "Cat 2", "Cat 3", "Cat 4", "Cat 5", "Cat 6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view
        
    }

}

//table view
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSection.general.rawValue + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch tableSection(rawValue: section) {
            case .main: title = "Main"
            case .soundsAndNotification: title = "Sounds and Notidications"
            case .general: title = "General"
            default: title = ""
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //переменная устанавливающая количество строк в секции
        var number: Int
        
        switch tableSection(rawValue: section) {
        case .main: number = sec1.data.count
        case .soundsAndNotification: number = sec2.data.count
        case .general: number = sec3.data.count
        default: number = 0
        }
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell") as! TableViewCell
        //Switch элемент, удалённый с макета ячейки
        let mySwitch = UISwitch()
       
        switch tableSection.init(rawValue: indexPath.section) {
        case .main:
            //проверка на содержание Switch элемента
            if sec1.data[indexPath.row].cellSwitch == "&"{
                cell.accessoryView = mySwitch
                cell.accessoryType = .none
                cell.secondLabel.isHidden = true
            }
            cell.label1.text = String(sec1.data[indexPath.row].title)
            cell.icon1.text = String(sec1.data[indexPath.row].icon)
            cell.secondLabel.text = String(sec1.data[indexPath.row].detail)
            
        case .soundsAndNotification:
            
            cell.label1.text = String(sec2.data[indexPath.row].title)
            cell.icon1.text = String(sec2.data[indexPath.row].icon)
            cell.secondLabel.text = String(sec2.data[indexPath.row].detail)
            
        case .general:
            cell.label1.text = String(sec3.data[indexPath.row].title)
            cell.icon1.text = String(sec3.data[indexPath.row].icon)
            cell.secondLabel.text = String(sec3.data[indexPath.row].detail)
            
        default: break
        }
        return cell
    }
}




//collection view
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width/2
        return CGSize(width: w, height: w)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCellImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.labelCell.text = collectionCellName[indexPath.row]
        cell.imageCell.image = collectionCellImage[indexPath.row]
        
        return cell
    }
}

