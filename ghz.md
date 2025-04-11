go install github.com/bojand/ghz/cmd/ghz@latest

ghz --proto packages\protos\proto\weebi_app_service.proto --call weebi.weebi_app.service.WeebiAppService.readAppMinimumVersion dev.weebi.com:443

cd packages/protos/proto
ghz --proto ticket/ticket_service.proto --call weebi.ticket.service.TicketService.readAll --rps 2 --concurrency 2 --total 20 -d '{\"chainId\":\"ID\", \"boutiqueId\": \"ID\"}' -m '{\"authorization\":\"BearerToken\"}'  dev.weebi.com:443


## 2025 april 10 
[ok] 20 responses
Summary:
Count: 20
Total: 36.77 s
Slowest: 3.915
Fastest: 2.20 s
Average: 3.515
Requests/sec: 0.54

latency distribution:
10 % in 3.21 s
25 % in 3.42 s
50 % in 3.58 s
75 % in 3.66 s
90 % in 3.81 s
95 % in 3.87 s
99 % in 3.91 s

## 2025 april 11 - after db pool different network

Summary:
  Count:        20
  Total:        36.64 s
  Slowest:      4.14 s
  Fastest:      2.57 s
  Average:      3.53 s
  Requests/sec: 0.55

Latency distribution:
  10 % in 2.59 s
  25 % in 2.76 s
  50 % in 3.77 s
  75 % in 3.98 s
  90 % in 4.06 s
  95 % in 4.08 s
  99 % in 4.14 s

Status code distribution:
  [OK]   20 responses