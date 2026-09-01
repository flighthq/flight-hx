# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 29392 |
| Modules with erasure | 1436 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 598 |
| `source-any` | 1166 |
| `source-never` | 178 |
| `source-null` | 232 |
| `source-undefined` | 508 |
| `source-unknown` | 4522 |
| `standard-toolkit-boundary` | 21609 |
| `unclassified` | 579 |
