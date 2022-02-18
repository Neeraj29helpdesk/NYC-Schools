//
//  SchoolTestVC.swift
//  20220218-NeerajSaini-NYCSchools
//
//  Created by Neeraj Saini on 18/02/22.
//

import UIKit

class SchoolTestVC: UIViewController {

    static let identifier = "SchoolTestVC"
    var schoolDetail = SchoolModel()
    var schoolTestDetail = SchoolTestModel()
    var schoolId = String()
    
    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblBuildingCode: UILabel!
    @IBOutlet weak var lblTotalStudents: UILabel!
    @IBOutlet weak var lblTestTaker: UILabel!
    @IBOutlet weak var lblReadingAverageScore: UILabel!
    @IBOutlet weak var lblMathAverageScore: UILabel!
    @IBOutlet weak var lblWitingAverageScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        schoolId = schoolDetail.dbn!
        //Get the school test detail
        Utility.showLoader()
        Webservices.instance.get(url: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json", params: nil) {( res: [SchoolTestModel]?, error) in
            Utility.hideLoader()
            if error == nil{
                let filterAry = res?.filter{ $0.dbn == self.schoolId }
                if filterAry!.count > 0{
                    self.schoolTestDetail = filterAry![0]
                    self.lblSchoolName.text = self.schoolDetail.school_name
                    self.lblLocation.text = self.schoolDetail.location
                    self.lblBuildingCode.text = self.schoolDetail.building_code
                    self.lblTotalStudents.text = self.schoolDetail.total_students
                    self.lblTestTaker.text = self.schoolTestDetail.num_of_sat_test_takers
                    self.lblReadingAverageScore.text = self.schoolTestDetail.sat_critical_reading_avg_score
                    self.lblMathAverageScore.text = self.schoolTestDetail.sat_math_avg_score
                    self.lblWitingAverageScore.text = self.schoolTestDetail.sat_writing_avg_score
                }
            }
        }
    }
}
