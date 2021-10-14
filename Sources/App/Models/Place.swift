//
//  Places.swift  
//  Created by saket bhushan on 11/10/21.
//
import Fluent
import Vapor

final class Place: Model, Content {
    static let schema = "places"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    required init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
