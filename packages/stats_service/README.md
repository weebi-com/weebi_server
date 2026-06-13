# Stats Service

gRPC service for statistics and charts.

## Purpose

- Provides a gRPC interface for clients to request financial charts.
- Enforces user permissions (`canSeeStats`) and firm-level access.
- Gates access behind premium license entitlements.
- Uses `charts_service` for data aggregation and SVG rendering.

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
