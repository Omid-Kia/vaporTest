import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello", String.parameter) { req -> String in
        let name = try req.parameters.next(String.self)
        return "Hello, \(name)"
    }
    
    router.post(InfoData.self, at: "info") { (request, data) -> InfoResponse in
        return InfoResponse(request: data)
    }
    
    router.post("login") { (request) -> Future<HTTPStatus> in
        return try request.content.decode(LoginRequest.self).map { (loginRequest) in
            print("username: ", loginRequest.userName)
            print("password", loginRequest.password)
            return .ok
        }
    }
    
    let loginController = LoginController()
    router.post("login", use: loginController.create)
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
