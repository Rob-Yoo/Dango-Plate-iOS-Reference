//
//  API.swift
//  DangoPlate
//
//  Created by Jinyoung Yoo on 11/7/23.
//

import Foundation

struct API {
    static let BASE_URL = ProcessInfo.processInfo.environment["BASE_URL"]!
    static let URL = ProcessInfo.processInfo.environment["URL"]!
    static let APP_KEY = ProcessInfo.processInfo.environment["APP_KEY"]!
    static var RESTAURANT_SEARCH: String {
        return BASE_URL + "/map/search"
    }
    static var SERVER_LOGIN : String {
        return URL + "/oauth/kakao/login"
    }
    static var USER_DATA : String {
        return URL + "/user/now"
    }
    static var RESTAURANT_INFO: String {
        return BASE_URL + "/shop"
    }
    static var REVIEW: String {
        return BASE_URL + "/review"
    }
    static var FAVORITE: String {
        return BASE_URL + "/favorite"
    }
}

