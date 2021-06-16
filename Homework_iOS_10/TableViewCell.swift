//
//  TableViewCell.swift
//  Homework_iOS_10
//
//  Created by Alexey Makarov on 15.05.2021.
//

import UIKit


class TableViewCell: UITableViewCell {
//1 cell
    @IBOutlet weak var labelName1: UILabel!
    
    @IBOutlet weak var icon1: UILabel!
    
    
//2 cell
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var switched: UISwitch!
    
//3 cell
    @IBOutlet weak var labelName3: UILabel!
    
    @IBOutlet weak var icon3: UILabel!
    
    @IBOutlet weak var icon: UILabel!
    
    
    
    override func awakeFromNib() {super.awakeFromNib()}
    override func setSelected(_ selected: Bool, animated: Bool) {super.setSelected(selected, animated: animated)}
}
