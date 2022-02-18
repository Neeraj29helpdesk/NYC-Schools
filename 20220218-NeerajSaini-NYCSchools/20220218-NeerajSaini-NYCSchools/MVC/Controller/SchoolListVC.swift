//
//  SchoolListVC.swift
//  20220218-NeerajSaini-NYCSchools
//
//  Created by Neeraj Saini on 18/02/22.
//

import UIKit

class SchoolListVC: UIViewController {
    
    static let identifier = "SchoolListVC"
    @IBOutlet weak var tblSchoolList: UITableView!
    
    var arySchools = [SchoolModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "School List"
        
        //Setup the Cell in list
        self.tblSchoolList.tableFooterView = nil
        self.tblSchoolList.estimatedRowHeight = 140
        self.tblSchoolList.rowHeight = UITableView.automaticDimension
        tblSchoolList.register(UINib(nibName: SchoolListCell.identifier, bundle: nil), forCellReuseIdentifier: SchoolListCell.identifier)
        self.tblSchoolList.dataSource = self
        self.tblSchoolList.delegate = self
        
        //getting the school list from the server
        Utility.showLoader()
        Webservices.instance.get(url: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json", params: nil) {( res: [SchoolModel]?, error) in
            Utility.hideLoader()
            if error == nil{
                //print("print School Model \(res)")
                self.arySchools = res!
                self.tblSchoolList.reloadData()
            }
        }
    }
}

extension SchoolListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arySchools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SchoolListCell! = tableView.dequeueReusableCell(withIdentifier: SchoolListCell.identifier) as? SchoolListCell
        
        let schoolDetail = arySchools[indexPath.row]
        cell.lblSchoolName.text = schoolDetail.school_name
        cell.lblLocation.text = schoolDetail.location
        cell.lblSchoolEmail.text = schoolDetail.school_email
        cell.lblWebsite.text = schoolDetail.website
        cell.lblPhone.text = schoolDetail.phone_number
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Storyboards.Main.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: SchoolTestVC.identifier) as! SchoolTestVC
        vc.schoolDetail = arySchools[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
