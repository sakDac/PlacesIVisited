//
//  PlacesController.swift
//  Created by saket bhushan on 11/10/21.
//

import Vapor

struct PlacesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let places = routes.grouped("places")
        places.get(use: index)
        places.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Place]> {
        return Place.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<Place> {
        let place = try req.content.decode(Place.self)
        return place.save(on: req.db).map { place }
    }
}
