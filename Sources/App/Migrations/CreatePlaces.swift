//
//  CreatePlaces.swift
//  Created by saket bhushan on 14/10/21.
//
import Fluent

struct CreatePlaces: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("places")
            .id()
            .field("name", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("places").delete()
    }
}
