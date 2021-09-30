import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get("test") { req in
        return req.view.render("index", ["title": "Hello Vapor!"])
    }
    
    app.get("index") {req in
        return Response(status: .ok,
                        headers: ["Content-Type": "text/html"],
                        body: """
            <!DOCTYPE html>
            <html lang="en">
            <head>
              <title>
                Nice job!
              </title>
              <style>
                body {
                    background: lightGray;
                }
                h1 {
                  position: absolute;
                  top: 30%;
                  left: 37.5%;
                }
             
                h1 span {
                  display: table-cell;
                  animation: animate 0.5s infinite;
                }
             
                /* Specify the animation keyframes
                   to be used to move the letters */
                @keyframes animate {
                  0% {
                    transform: translateY(0px);
                  }
             
                  50% {
                    transform: translateY(-20px);
                  }
             
                  100% {
                    transform: translateY(0px);
                  }
                }
                /* Specify a slight delay for
                    each of the letters */
                    h1 span:nth-child(1) {
                    animation-delay: 0.1s;
                    }
                
                    h1 span:nth-child(2) {
                    animation-delay: 0.2s;
                    }
                
                    h1 span:nth-child(3) {
                    animation-delay: 0.3s;
                    }
              </style>
            </head>
            <body>
              <h1>
                <span style="font-size:100px" > &#x1F95A; </span>
                <span style="font-size:100px" > &#x1F95A; </span>
                <span style="font-size:100px" > &#x1F95A; </span>
              </h1>
            </body>
            </html>
            """)
    }
    
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
}
