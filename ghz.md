go install github.com/bojand/ghz/cmd/ghz@latest

ghz --proto packages\protos\proto\weebi_app_service.proto --call weebi.weebi_app.service.WeebiAppService.readAppMinimumVersion dev.weebi.com:443
 

ghz --proto packages/protos/proto/ticket/ticket_service.proto --call weebi.ticket.service.TicketService.readAll --rps 2 --concurrency 2 -d '{"chainId":"ID", "boutiqueId": "ID"}' -m '{"authorization":"BearerToken"}'  dev.weebi.com:443

[ok] 20 responses
Summary:
Count: 20
Total: 36.77 s
Slowest: 3.915
Fastest: 2.20 s
Average: 3.515
Requests/sec: 6.54

latency distribution:
10 % in 3.21 s
25 % in 3.42 s
50 % in 3.58 s
75 % in 3.66 s
90 % in 3.81 s
95 % in 3.87 s
99 % in 3.91 s


--config option

{
    "proto": "/path/to/greeter.proto",
    "call": "helloworld.Greeter.SayHello",
    "total": 2000,
    "concurrency": 50,
    "data": {
        "name": "Joe"
    },
    "metadata": {
        "foo": "bar",
        "trace_id": "{{.RequestNumber}}",
        "timestamp": "{{.TimestampUnix}}"
    },
    "import-paths": [
        "/path/to/protos"
    ],
    "max-duration": "10s",
    "host": "0.0.0.0:50051"
}