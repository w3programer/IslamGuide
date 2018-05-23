
import Foundation
import  Alamofire
import  SwiftyJSON
extension Api{
    class func ReadMoreApi( _ url:String? , completion: @escaping (_ error : Error? , _ ResultData: [ReadMoreStruct]? )->Void){
        let url = url
        Alamofire.request(url!).responseJSON{response in
            switch response.result
            {
            case .failure(let error):
                completion(error ,nil)
                print( error)
            case .success(let value):
                let json = JSON(value)
                guard  let DataArr = json.array else{
                    completion(nil, nil)
                    return
                }
                var results = [ReadMoreStruct]()

                for data in DataArr{
                    guard (data.dictionary != nil)  else {return}
                    let result = ReadMoreStruct()
                    result.lang = data["lang"].int ?? 0
                    result.address = data["address"].string ??  ""
                    result.link = data["link"].string ??  ""
                    results.append(result)
                }
                 completion(nil, results)
            }
            
        }
        
        
    }
}
