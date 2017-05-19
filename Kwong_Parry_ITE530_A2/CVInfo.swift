import Foundation

public class CVInfo{ //CV Information
    
    let name = "Parry Kwong"
    let age = 23
    let school = "Charles Sturt University"
    let major = "Masters of Mobile App Dev."
    let company = ["linkedin", "facebook", "twitter", "morgan stanley", "google"]
    let text = ["LinkedIn Internship", "Facebook Internship", "Twitter Programmer", "Morgan Stanley Analyst", "Google Marketing Assistant"]
    let year = ["2009-2011", "2011-2012","2012-2013","2013-2014","2014-2017"]
    let jobDescription = [ "-Worked primarily with the marketing team to promote LinkedIn newest features \n-Awarded outstanding staff of the month for June 2009",
                           
                           "-Involved in a marketing campaign for new Facebook ad features \n-Pitched to our closest clients regarding FB ad services",
                           "-Worked on Twitter's backend regarding database support and streamlining data \n-Played vital role in Twitter website updates",
                           "-Worked with clients for refinancing company assets and liquidation \n-Top performing analyst for year 2014",
                           "-Pitched and planned for Google's newest marketing campaign on Google Cloud \n-Featured on Google magazine for outstanding performance"
    ]
    
    var imageArray = [String]()
    var backgroundArray = ["linkedin_background", "facebook_background", "twitter_background",
                           "morganstanley_background", "google_background"]
    
    func printInfo() -> String{
        
        return "Name: \(name) \nAge: \(age) \nSchool: \(school) \nMajor: \(major)"
    }
    
    func addImages(){
        
        for num in 1 ... 12 {
            imageArray.append("image\(num)")
        }
    }
    
}
