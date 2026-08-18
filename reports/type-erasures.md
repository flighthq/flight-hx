# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 24164 |
| Modules with erasure | 1116 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 606 |
| `source-any` | 1008 |
| `source-never` | 110 |
| `source-null` | 74 |
| `source-undefined` | 264 |
| `source-unknown` | 3810 |
| `standard-toolkit-boundary` | 17927 |
| `unclassified` | 365 |
