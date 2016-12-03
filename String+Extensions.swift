//
//  String+Extensions.swift
//  Swift Utilities
//
//  Created by Tre`Von McKay on 10/22/16.
//

import Foundation

extension String{
    
    var length:Int {
        get{
            return self.characters.count
        }
    }
    
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    /*
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return self[start..<end]
    }
    */
    subscript (r: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return self[start...end]
    }
    
    static func convertStringToDictionary(_ text: String) -> [String:AnyObject]?{
        
        if let data = text.data(using: String.Encoding.utf8){
            do{
                return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
            }
            catch let err as NSError{
                debugPrint(err)
            }
        }
        
        return nil
    }
    
    static func urlEscape(_ parameters: [String:String]) -> String {
        let queryString = parameters.flatMap { (key, value) -> String? in
            return "\(key)=\(value)"
            }.joined(separator: "&")
        
        return queryString
    }
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    func firstCharacter() -> Character? {
        if self.isEmpty() {
            return nil
        }
        return self[0]
    }
    
    func alphanumeric() -> String {
        let alphaNumericCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        let nonAlphaNumericCharacterSet = alphaNumericCharacterSet.inverted
        let result = self.components(separatedBy: nonAlphaNumericCharacterSet).joined(separator: "")
        return result
    }
    
    func lastCharacter() -> Character? {
        if self.isEmpty() {
            return nil
        }
        
        let endIndex = self.length - 1
        return self[endIndex]
    }
    
    func isEmpty() -> Bool {
        return (self.length == 0)
    }
    
    func toDictionary(_ text: String) -> [String:AnyObject]?{
        return String.convertStringToDictionary(text)
    }
}
