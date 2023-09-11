import Foundation

public enum AuthAuthorityType: String, Decodable {
    case student = "STUDENT"
    case company = "COMPANY"
    case teacher = "TEACHTER"
    case developer = "DEVELOPER"
}
