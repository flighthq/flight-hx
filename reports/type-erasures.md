# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 24146 |
| Modules with erasure | 1119 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 606 |
| `source-any` | 965 |
| `source-never` | 110 |
| `source-null` | 74 |
| `source-undefined` | 264 |
| `source-unknown` | 3832 |
| `standard-toolkit-boundary` | 17930 |
| `unclassified` | 365 |
