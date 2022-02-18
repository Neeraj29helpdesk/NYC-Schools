//
//  Webservices.swift
//  20220218-NeerajSaini-NYCSchools
//
//  Created by Neeraj Saini on 18/02/22.
//

import Foundation
import Alamofire

final class Webservices: NSObject{
    
    static let instance = Webservices()
    
    static var isConnectedToInternet: Bool{
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func get<T:Codable>(url:String, params:[String:Any]?, completion: @escaping (T?, _ error: String?) -> ()) {
        
        if Webservices.isConnectedToInternet == false {
            completion(nil,ErrorMessages.noInternet)
            return
        }
        
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(model,nil)
                } catch let jsonErr {
                    completion(nil,jsonErr.localizedDescription)
                }
            case .failure(let err):
                completion(nil,err.localizedDescription)
            }
        }
        
    }
}
