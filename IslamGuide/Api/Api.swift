
import UIKit
import Alamofire
import  SwiftyJSON
class Api: NSObject {
    
    /*
    class func login(username:String ,password:String ,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = Urls.login
        let parameters = [
            "user_name":username,
            "user_pass": password
        ]
        Alamofire.request(BaseUrl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    completion(error , false)
                case .success(let value):
                    completion(nil ,true)
                    let data = JSON(value)
                    if  let usernamevalue = data["user_id"].string{
                        print(usernamevalue)
                    }
                    
                }
                
        }
        
    }
    
    
    class func registration(username:String ,password:String ,token:String,email:String,phone:String,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = Urls.register
        let parameters = [
            "user_name":username,
            "user_pass": password,
            "user_email":email,
            "user_phone": phone,
            "token_id": token
        ]
        Alamofire.request(BaseUrl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    completion(error , false)
                case .success(let value):
                    completion(nil ,true)
                    let data = JSON(value)
                    if  let usernamevalue = data["user_id"].string{
                        print(usernamevalue)
                    }
                    
                }
                
        }
        
    }*/
    
    
    
}
