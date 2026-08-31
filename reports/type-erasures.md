# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 29168 |
| Modules with erasure | 1412 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 598 |
| `source-any` | 1168 |
| `source-never` | 143 |
| `source-null` | 206 |
| `source-undefined` | 508 |
| `source-unknown` | 4479 |
| `standard-toolkit-boundary` | 21570 |
| `unclassified` | 496 |
