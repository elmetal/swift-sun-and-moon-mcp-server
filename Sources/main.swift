import MCP

let server = Server(
    name: "Sun and Moon",
    version: "1.0.0",
    capabilities: .init(
        prompts: .init(listChanged: true),
        resources: .init(subscribe: true, listChanged: true),
        tools: .init(listChanged: true)
    )
)

let transport = StdioTransport()
try await server.start(transport: transport)

await server.withMethodHandler(ListTools.self) { _ in
    return ListTools.Result(
        tools: [
            .init(name: "SunAndMoon",
                  description: "",
                  inputSchema: [
                    "type": "object",
                    "properties": [:],
                  ])
        ]
    )
}

await server.withMethodHandler(CallTool.self) { params in
    if params.name == "SunAndMoon" {
        return CallTool.Result(
            content: [.text("Moon")],
            isError: false
        )
    }
    return CallTool.Result(
        content: [.text("Tool not found or service not enabled: \(params.name)")],
        isError: true
    )
}
try await server.notify(ToolListChangedNotification.message())

await server.stop()
