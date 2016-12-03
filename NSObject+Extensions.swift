//
//  NSObject+Extensions.swift
//  Swift Utilities
//
//  Created by Tre`Von McKay on 10/22/16.
//

import Foundation

extension NSObject{
    
    class var className: String{
        return String(describing: self)
    }
    
    var className: String{
        return String(describing: type(of: self))
    }
    
    func toDictionary() -> NSDictionary{
        
        debugPrint(self)
        
        let dict:NSMutableDictionary = NSMutableDictionary()
        let properties = Mirror(reflecting: self).children
        
        for prop in properties{
            if let propName = prop.label{
                if self.value(forKey: propName) == nil {
                    debugPrint("value for \(propName) is nil")
                    continue;
                }
                
                let val:AnyObject! = self.value(forKey: propName) as AnyObject!
                
                if(val is String)
                {
                    debugPrint("String",propName,":",val)
                    dict.setValue(val as! String, forKey: propName)
                    //dict[propName] = val as! String
                }
                else if (val is Double)
                {
                    debugPrint("Double",propName,":",val)
                    //dict[propName] = val as! Double
                    dict.setValue(val as! Double, forKey: propName)
                }
                else if (val is Array<String>)
                {
                    debugPrint("Array<String>",propName,":",val)
                    //dict[propName] = val as! Array<String>
                    dict.setValue(val as! Array<String>, forKey: propName)
                }
                else if (val is Dictionary<String, String>)
                {
                    debugPrint("Dictionary<String,String>",propName,":",val)
                    //dict[propName] = val as! Dictionary<String, String>
                    dict.setValue(val, forKey: propName)
                }
                else
                {
                    if let v = val{
                        debugPrint(propName,":",v)
                        dict[propName] = v
                    }
                    else{
                        debugPrint(propName,":nil")
                        dict[propName] = nil
                    }
                    
                }
            }
        }
        
        return dict
    }
    
    func toJSONData() -> Data?{
        debugPrint("Converting object to a dictionary")
        var dict:NSDictionary
        if( self is NSDictionary ){
            dict = self as! NSDictionary;
        }
        else{
            dict = self.toDictionary();
        }
        debugPrint(dict)
        if(JSONSerialization.isValidJSONObject(dict)){
            do{
                debugPrint("Converting dictionary to JSON")
                let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
                return jsonData
            }
            catch{
                debugPrint("Failed to convert object to JSON")
                return nil
            }
        }
        else{
            debugPrint("Dictionary object is not a valid JSON object")
            return nil
        }
    }
    
    func toJSONString() -> String?{
        debugPrint("Converting object to JSON string")
        if let jsonData = self.toJSONData(){
            let jsonString:String = String(data: jsonData, encoding: String.Encoding.utf8)!
            debugPrint(jsonString)
            return jsonString
        }
        return nil
    }
}
