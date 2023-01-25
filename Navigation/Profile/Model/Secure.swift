//
//  File.swift
//  Navigation
//
//  Created by MacBook Air on 15.01.2023.
//

import UIKit
 

enum errors: Error {
    case loginEmpty
    case passwordEmpty
    case statusEmpty
    case notEmail
    case password(Int)
}

private func trim(_ testString: String) -> String {
    if let string = testString.firstMatch(of: /^\s*(.*\S)\s*$/) {
        return String(string.1)
    } else {
        return ""
    }
}

private func checkEmail(_ testString: String) -> Bool {
    testString.firstMatch(of: /^[a-z0-9][-._a-z0-9]{0,20}@[a-z0-9][-.a-z0-9]{0,30}[a-z0-9].[a-z]{2,8}$/.ignoresCase()) != nil
}

private func checkPassword(_ testString: String) -> Bool {
    testString.count >= 4
}

public func checkLoginField(_ testString: String) throws -> String {
    let login = trim(testString)
    guard !login.isEmpty      else { throw errors.loginEmpty }
    guard checkEmail(login)   else { throw errors.notEmail}
    return login
}

public func checkPasswordField(_ testString: String) throws -> Bool {                
    guard !testString.isEmpty       else { throw errors.passwordEmpty }
    guard checkPassword(testString) else { throw errors.password(testString.count) }
    return true
}

public func checkStatusField(_ testString: String) throws -> String {
    let status = trim(testString)
    guard !status.isEmpty else { throw errors.statusEmpty}
    return status
}

