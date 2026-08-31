# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 29197 |
| Modules with erasure | 1414 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 602 |
| `source-any` | 1168 |
| `source-never` | 143 |
| `source-null` | 204 |
| `source-undefined` | 532 |
| `source-unknown` | 4468 |
| `standard-toolkit-boundary` | 21584 |
| `unclassified` | 496 |
