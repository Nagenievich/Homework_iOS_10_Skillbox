//
//  TableViewCell.swift
//  Homework_iOS_10
//
//  Created by Alexey Makarov on 15.05.2021.
//

import UIKit


class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var switched: UISwitch!
    
    @IBOutlet weak var icon: UILabel!
    
    
    
    override func awakeFromNib() {super.awakeFromNib()}
    override func setSelected(_ selected: Bool, animated: Bool) {super.setSelected(selected, animated: animated)}
}
