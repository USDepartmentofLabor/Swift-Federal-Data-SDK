//
//  GovDataRequest.swift
//
//
//  Created by Michael Pulsifer (U.S. Department of Labor) on 6/18/14.
//  License: Public Domain
//

import Foundation

protocol GovDataRequestProtocol {
    func didCompleteWithError(errorMessage: String)
    func didCompleteWithDictionary(results: NSDictionary)
    func didCompleteWithXML(results:XMLIndexer)
    func didCompleteWithArray(results: NSArray)
    func didComplete(results: NSString)
}

class GovDataRequest : NSObject, URLSessionDelegate {
    
    var delegate: GovDataRequestProtocol? = nil
    
    var APIKey = ""
    var APIHost = ""
    var APIURL = ""
    var responseFormat = "JSON"
    var timeOut = 60.0
    
    let URL_API_V1 = "https://api.dol.gov"
    let URL_API_V2 = "https://data.dol.gov"
    
    init(APIKey: String, APIHost: String, APIURL:String) {
        self.APIKey = APIKey
        self.APIHost = APIHost
        self.APIURL = APIURL
    }
    
    
    func callAPIMethod (method: String, arguments: Dictionary<String,String>) {
        // Construct the base url based on the provided information
        var url = APIHost + APIURL + "/" + method
        // Start building the query string
        var queryString = ""
        
        // Where appropriate, add the key
        switch APIHost {
        case URL_API_V1:
            queryString = "?KEY=" + APIKey
        case URL_API_V2:
            queryString = ""
        case "http://api.census.gov", "http://pillbox.nlm.nih.gov":
            queryString = "?key=" + APIKey
        case "http://api.eia.gov", "http://developer.nrel.gov", "http://api.stlouisfed.org", "http://healthfinder.gov":
            queryString = "?api_key=" + APIKey
        case "http://www.ncdc.noaa.gov":
            queryString = "?token=" + APIKey
        default:
            // do nothing for now
            print("doing nothing for now")
        }
        
        //Construct the arguments part of the query string
        for (argKey, argValue) in arguments {
            switch APIHost {
            case URL_API_V1:
                // DOL's V1 API has specific formatting requirements for arguments in the query string
                switch argKey {
                case "top", "skip", "select", "orderby", "filter":
                    queryString += "&$" + argKey + "=" + argValue
                case "format", "query", "region", "locality", "skipcount":
                    queryString += "&" + argKey + "=" + argValue
                default:
                    print("nothing to see here")
                }
            case URL_API_V2:
                queryString += "/" + argKey + "/" + argValue
            case "http://go.usa.gov":
                // go.usa.gov requires that the apiKey be the 2nd argument
                if queryString == "" {
                    queryString += "?" + argKey + "=" + argValue + "&apiKey=" + APIKey
                } else {
                    queryString += "&" + argKey + "=" + argValue
                }
            default:
                if queryString == "" {
                    queryString += "?" + argKey + "=" + argValue
                } else {
                    queryString += "&" + argKey + "=" + argValue
                }
            }
            
        }
        
        //If there are arguments, append them to the url
        if queryString != "" {
            url += queryString
        }
        
        //DOT FMCSA requires that the key be placed at the end.
        if APIHost == "https://mobile.fmcsa.dot.gov" {
            if queryString != "" {
                url += "&webKey=" + APIKey
            } else {
                url += "?webKey=" + APIKey
            }
        }
        
        
        
        // Send the request to the API and parse
        var urlToPackage = url //.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        print(urlToPackage)
        var urlToSend: NSURL = NSURL(string: urlToPackage)!
        var apiSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
        apiSessionConfiguration.timeoutIntervalForRequest = timeOut
        //var session = URLSession(session: , didReceiveChallenge: self, completionHandler: OperationQueue.mainQueue()
        var session = URLSession(configuration: apiSessionConfiguration, delegate: self, delegateQueue:OperationQueue.main)
        var request = NSMutableURLRequest(url:urlToSend as URL)
        request.addValue("application/json",forHTTPHeaderField:"Accept")
        if (APIHost == URL_API_V2) {
            request.addValue(APIKey, forHTTPHeaderField: "X-API-KEY")
        }
        var task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if((error) != nil) {
                // if there is an error in the request, print it to the console
                self.delegate?.didCompleteWithError(errorMessage: (error?.localizedDescription)!)
                //println(error.localizedDescription)
                print("oops!")
            }
            var err: NSError?
            print("*********")
            print("About to try to parse")
            print("*********")
            if self.responseFormat == "JSON" {
//                if let jsonResult: Any = JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) {
                do {
                    if let jsonResult: Any = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) {
                        if(err != nil) {
                            // If there is an error parson JSON, print it to the console
                            NSLog ("Error parsing the JSON")
                        }
                        if jsonResult is NSDictionary {
                            print("*********")
                            print("Dictionary")
                            print("*********")
                            self.delegate?.didCompleteWithDictionary(results: jsonResult as! NSDictionary)
                        }
                        else if jsonResult is NSArray {
                            print("*********")
                            print("Array")
                            print("*********")
                            self.delegate?.didCompleteWithArray(results: jsonResult as! NSArray)
                        }
                        else {
                            print("*********")
                            print("Something else")
                            print("*********")
                            //return Object
                            self.delegate?.didComplete(results: jsonResult as! NSString)
                        }
                    }
                } catch {
                    NSLog ("Error parsing the JSON")
                    
                }
                
            } else if self.responseFormat == "XML" {
                //let parser = SWXMLHash()
                var dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let xml = SWXMLHash.parse(data!)
                self.delegate?.didCompleteWithXML(results: xml)
            } else {
                print("*********")
                print("Neither JSON nor XML")
                print("*********")
            }
            print("*********")
            print("Outside the if")
            print("*********")
        })
        task.resume()
    }
 
/*    private func URLSession(session: URLSession, didReceiveChallenge challenge: URLAuthenticationChallenge, completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(URLSession.AuthChallengeDisposition.UseCredential, URLCredential(forTrust: challenge.protectionSpace.serverTrust))
    }
 */
    
    
}
