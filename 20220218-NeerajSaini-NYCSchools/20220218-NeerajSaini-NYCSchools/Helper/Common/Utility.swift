//
//  Utility.swift
//  20220218-NeerajSaini-NYCSchools
//
//  Created by Neeraj Saini on 18/02/22.
//

import Foundation
import UIKit
import SVProgressHUD

class Utility{
    
    //show the progressive loader
    class func showLoader(){
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setForegroundColor(UIColor.gray)           //Ring Color
        SVProgressHUD.setBackgroundColor(UIColor.white)        //HUD Color
        SVProgressHUD.setBackgroundLayerColor(UIColor.clear)
        SVProgressHUD.show()
    }
    
    //hide the progressive loader
    class func hideLoader(){
        SVProgressHUD.dismiss()
    }
}

