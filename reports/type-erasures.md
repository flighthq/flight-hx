# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 24421 |
| Modules with erasure | 1187 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 605 |
| `source-any` | 964 |
| `source-never` | 96 |
| `source-null` | 78 |
| `source-undefined` | 263 |
| `source-unknown` | 3402 |
| `standard-toolkit-boundary` | 18030 |
| `unclassified` | 983 |
