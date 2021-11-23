//
//  TableViewCell.swift
//  Homework_iOS_10
//
//  Created by Alexey Makarov on 15.05.2021.
//

import UIKit


class TableViewCell: UITableViewCell {

    @IBOutlet  var icon1: UILabel!
    @IBOutlet  var label1: UILabel!
    @IBOutlet  var switched: UISwitch!
    @IBOutlet weak var secondLabel: UILabel!
    
    
    override func awakeFromNib() {super.awakeFromNib()}
    override func setSelected(_ selected: Bool, animated: Bool) {super.setSelected(selected, animated: animated)}
}
