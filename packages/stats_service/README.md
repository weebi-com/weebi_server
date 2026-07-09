# Stats Service

gRPC service for statistics and charts.

## Purpose

- Provides a gRPC interface for clients to request financial charts.
- Enforces user permissions (`canSeeStats`) and firm-level access.
- Gates access behind premium license entitlements.
- Aggregates financial data (tickets) from MongoDB and renders SVG charts.

## RPCs

### `getFinancialChart`

Returns an SVG chart based on the provided request parameters.

- **Request**: `FinancialChartRequest`
- **Response**: `FinancialChartResponse` (contains `svgContent`)

## Development

To run tests:
```bash
dart test
```
