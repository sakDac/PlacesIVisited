import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // This is to configure leaf
    app.views.use(.leaf)
    
    // Configuring DB
    app.databases.use(.postgres(hostname: "localhost",
                                username: "saket",
                                password: "Saket1234",
                                database: "placesdb"), as: .psql)

    // Starting migration to keep logs for db changes
    app.migrations.add(CreatePlaces())
    
    // register routes
    try routes(app)
}
