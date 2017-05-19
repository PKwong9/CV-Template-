import Foundation

public class CVInfo{ //CV Information (the info has been hardcoded for this project)
    
    let name = //your name
    let age = //your age
    let school = //school
    let major = //major
    let company = //in array form
    let text = //in array form
    let year = //in array form
    let jobDescription = //in array form
    ]
    
    var imageArray = [String]()
    var backgroundArray = 
    
    func printInfo() -> String{
        
        return "Name: \(name) \nAge: \(age) \nSchool: \(school) \nMajor: \(major)"
    }
    
    func addImages(){
        
        for num in 1 ... 12 {
            imageArray.append("image\(num)")
        }
    }
    
}
