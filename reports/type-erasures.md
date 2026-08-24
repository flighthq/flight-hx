# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 31848 |
| Modules with erasure | 1193 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 12 |
| `source-any` | 6916 |
| `source-never` | 120 |
| `source-null` | 86 |
| `source-undefined` | 3 |
| `source-unknown` | 3897 |
| `standard-toolkit-boundary` | 20383 |
| `unclassified` | 431 |
