# ghz

go install github.com/bojand/ghz/cmd/ghz@latest

## LOCAL
better since same machine is used and no network variations

ghz --insecure --proto packages\protos\proto\weebi_app_service.proto --call weebi.weebi_app.service.WeebiAppService.readAppMinimumVersion 0.0.0.0:8080

ghz --insecure --proto ticket/ticket_service.proto --call weebi.ticket.service.TicketService.readAll --rps 2 --concurrency 2 --total 20 -d '{\"chainId\":\"ID\", \"boutiqueId\": \"ID\"}' -m '{\"authorization\":\"BearerToken\"}'  0.0.0.0:8080

### 3 000 tickets
## 2025 April 14 - first run

Summary:
  Count:        20
  Total:        19.11 s
  Slowest:      1.96 s
  Fastest:      1.36 s
  Average:      1.84 s
  Requests/sec: 1.05

Status code distribution:  [OK]   20 responses

## 2025 April 14 - full isolate

Summary:
  Count:        20
  Total:        19.60 s
  Slowest:      2.46 s
  Fastest:      1.30 s
  Average:      1.87 s
  Requests/sec: 1.02

Status code distribution:  [OK]   20 responses

## 2025 April 14 - isolate with Type implementation 
Summary:
  Count:        20
  Total:        19.07 s
  Slowest:      2.10 s
  Fastest:      1.35 s
  Average:      1.82 s
  Requests/sec: 1.05

Status code distribution:  [OK]   20 responses


## 2025 April 14 - isolate with Type implementation keeping the worker open
Summary:
  Count:        20
  Total:        19.86 s
  Slowest:      2.36 s
  Fastest:      1.36 s
  Average:      1.91 s
  Requests/sec: 1.01