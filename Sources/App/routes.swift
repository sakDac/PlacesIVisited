import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get("htmlFile") { request -> EventLoopFuture<View> in
        let userName = try request.query.get(String.self, at: "name")
        return request.view.render("Eggs", ["name": userName])
    }

    app.post("addPalces") { request -> EventLoopFuture<Place> in
        let place = try request.content.decode(Place.self)
        return place.create(on: request.db).map { place }
    }
    
    app.get("getPlaces") { (request) -> EventLoopFuture<[Place]> in
        return Place.query(on: request.db).all()
    }
}
