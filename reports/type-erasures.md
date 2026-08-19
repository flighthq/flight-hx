# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 24157 |
| Modules with erasure | 1119 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 606 |
| `source-any` | 965 |
| `source-never` | 116 |
| `source-null` | 74 |
| `source-undefined` | 264 |
| `source-unknown` | 3832 |
| `standard-toolkit-boundary` | 17935 |
| `unclassified` | 365 |
