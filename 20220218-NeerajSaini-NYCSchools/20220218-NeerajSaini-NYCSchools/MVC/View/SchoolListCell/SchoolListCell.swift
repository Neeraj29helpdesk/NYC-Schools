//
//  SchoolListCell.swift
//  20220218-NeerajSaini-NYCSchools
//
//  Created by Neeraj Saini on 18/02/22.
//

import UIKit

class SchoolListCell: UITableViewCell {

    static let identifier = "SchoolListCell"
    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblSchoolEmail: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
