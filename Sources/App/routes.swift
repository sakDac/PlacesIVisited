import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get("htmlFile") { request -> EventLoopFuture<View> in
        let userName = try request.query.get(String.self, at: "name")
        return request.view.render("Eggs", ["name": userName])
    }
}
