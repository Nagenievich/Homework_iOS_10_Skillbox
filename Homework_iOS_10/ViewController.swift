//
//  ViewController.swift
//  Homework_iOS_10
//
//  Created by Alexey Makarov on 27.04.2021.
//

import UIKit

//table view
struct Meetup {
    var main = ""
    var elements:[String]
    var icon:[String]
    let swicthView = UISwitch(frame: .zero)
    swicthView.setOn(false, animated: true)
    swicthView.tag = indexPath.row
    swicthView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
    
}

class MeetupFabric{
    static func meetups() -> [Meetup] {
        return [
            Meetup(main: "Main", elements: ["Avia"], icon: ["✈️"],),
            Meetup(main: "Main", elements: ["Avia", "Wi-Fi", "Bluetooth", "Mobile", "Modem"], icon: ["✈️", "📶", "📳", "📱", "📡"]),
            Meetup(main: "Sound and notification", elements: ["Notification", "Sounds", "Do Not Disturb", "Screen"], icon: ["❗️", "🔈", "🤫", "📺"]),
            Meetup(main: "General", elements: ["General", "Control Centre", " Display", "Home Screen", "Accessibility", "Wallaper"], icon: ["⚙️", "🖥", "📱", "📺", "🚹", "🌃"])
        ]
    }
}

class ViewController: UIViewController {
    
    //table view
    var meetups = MeetupFabric.meetups()

  
    var collectionCellImage = [UIImage(named: "cat1"), UIImage(named: "cat2"),UIImage(named: "cat3"), UIImage(named: "cat4"), UIImage(named: "cat5"), UIImage(named: "cat6")] 
    var collectionCellName = ["Cat 1", "Cat 2", "Cat 3", "Cat 4", "Cat 5", "Cat 6"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//table view
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return meetups.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meetups[section].main
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetups[section].elements.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableViewCell
        let name = meetups[indexPath.section].elements[indexPath.row]
        let icon = meetups[indexPath.section].icon[indexPath.row]
        //cell
        cell.labelName.text = name
        cell.icon.text = icon
        
        //switch
        let swicthView = UISwitch(frame: .zero)
        swicthView.setOn(false, animated: true)
        swicthView.tag = indexPath.row
        swicthView.addTarget("Avia", action: #selector(self.switchChanged(_:)), for: .valueChanged)
               
        
        
        return cell
    }
    
    @objc func switchChanged(_ sender: UISwitch!) {
           
           print("Table row switch Changed \(sender.tag)")
           print("The switch is \(sender.isOn ? "ON" : "OFF")")
           
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

//
