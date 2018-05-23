import UIKit
class Helper: NSObject {
    class func saveApiToken(token : String){
        let def = UserDefaults.standard
        def.setValue(token, forKey: "apitoken")
        def.synchronize()
        
    }
    class func getApiToken()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "apitoken") as? String)!
        
    }
}
