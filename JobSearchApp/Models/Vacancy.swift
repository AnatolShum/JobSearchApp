//
//  Vacancy.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation
import SwiftData

@Model
class Vacancy: Codable, Equatable, Identifiable {
    @Attribute(.unique) var id: String
    var lookingNumber: Int?
    var title: String
    var address: Address
    var company: String
    var experience: Experience
    var publishedDate: String
    var isFavorite: Bool
    var salary: Salary
    var schedules: [String]
    var appliedNumber: Int?
    var specification: String?
    var responsibilities: String
    var questions: [String]
    
    init(id: String, 
         lookingNumber: Int? = nil,
         title: String,
         address: Address,
         company: String,
         experience: Experience,
         publishedDate: String,
         isFavorite: Bool,
         salary: Salary,
         schedules: [String],
         appliedNumber: Int? = nil,
         specification: String? = nil,
         responsibilities: String,
         questions: [String]
    ) {
        self.id = id
        self.lookingNumber = lookingNumber
        self.title = title
        self.address = address
        self.company = company
        self.experience = experience
        self.publishedDate = publishedDate
        self.isFavorite = isFavorite
        self.salary = salary
        self.schedules = schedules
        self.appliedNumber = appliedNumber
        self.specification = specification
        self.responsibilities = responsibilities
        self.questions = questions
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case lookingNumber
        case title
        case address
        case company
        case experience
        case publishedDate
        case isFavorite
        case salary
        case schedules
        case appliedNumber
        case specification = "description"
        case responsibilities
        case questions
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        lookingNumber = try container.decodeIfPresent(Int.self, forKey: .lookingNumber)
        title = try container.decode(String.self, forKey: .title)
        address = try container.decode(Address.self, forKey: .address)
        company = try container.decode(String.self, forKey: .company)
        experience = try container.decode(Experience.self, forKey: .experience)
        publishedDate = try container.decode(String.self, forKey: .publishedDate)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        salary = try container.decode(Salary.self, forKey: .salary)
        schedules = try container.decode([String].self, forKey: .schedules)
        appliedNumber = try container.decodeIfPresent(Int.self, forKey: .appliedNumber)
        specification = try container.decodeIfPresent(String.self, forKey: .specification)
        responsibilities = try container.decode(String.self, forKey: .responsibilities)
        questions = try container.decode([String].self, forKey: .questions)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(lookingNumber, forKey: .lookingNumber)
        try container.encode(title, forKey: .title)
        try container.encode(address, forKey: .address)
        try container.encode(company, forKey: .company)
        try container.encode(experience, forKey: .experience)
        try container.encode(publishedDate, forKey: .publishedDate)
        try container.encode(isFavorite, forKey: .isFavorite)
        try container.encode(salary, forKey: .salary)
        try container.encode(schedules, forKey: .schedules)
        try container.encode(appliedNumber, forKey: .appliedNumber)
        try container.encode(specification, forKey: .specification)
        try container.encode(responsibilities, forKey: .responsibilities)
        try container.encode(questions, forKey: .questions)
    }
    
    static func ==(lhs: Vacancy, rhs: Vacancy) -> Bool {
        return lhs.id == rhs.id
    }
}
