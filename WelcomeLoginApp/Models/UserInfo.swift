//
//  UserInfo.swift
//  lesson2.3logIn
//
//  Created by Anton Duplin on 22/1/22.
//

import Foundation

struct UserInfo {
    let userName: String
    let password: String
    let info: Info
    static func getUserInfo() -> UserInfo {
        UserInfo(userName: "anton", password: "123456", info: Info.getPersonInfo())
    }
    
}

struct Info {
    let name: String
    let surname: String
    let birthday: String
    let placeOfBirth: String
    let placeOfresidence: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    var fullInfo: String {
        """
        Name: \(name)
        Surname: \(surname)
        Birthday: \(birthday)
        Place of Birth: \(placeOfBirth)
        Place of Residence: \(placeOfresidence)
"""
    }
    
    static func getPersonInfo() -> Info {
        Info(name: "Anton", surname: "Duplin", birthday: "25.12.1990", placeOfBirth: "Russia/Samara", placeOfresidence: "Greece/Athens", image: "anton")
    }
}


