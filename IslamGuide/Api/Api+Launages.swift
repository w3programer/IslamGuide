
import Foundation
import  Alamofire
import  SwiftyJSON
extension Api{
    class func launages(completion: @escaping (_ error : Error? , _ launages: [Launages]?)->Void){
        let url = Urls.launagesurl
        Alamofire.request(url).responseJSON{response in
            switch response.result
            {
            case .failure(let error):
                completion(error ,nil)
                print( error)
            case .success(let value):
                guard  let DataArr =  JSON(value).array else{
                    completion(nil, nil)
                    return
                }
                var launages = [Launages]()
                for data in DataArr{
                    guard data.dictionary != nil else {return}
                    let lang = Launages()
                    lang.id = data["id"].int ?? 0
                    lang.name = data["name"].string ??  ""
                    lang.flag = data["flag"].string ??  ""

                     launages.append(lang)

                }
                completion(nil, launages)
            }
            
        }
        

    }
}
