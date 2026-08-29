# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 28172 |
| Modules with erasure | 1363 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 611 |
| `source-any` | 1121 |
| `source-never` | 127 |
| `source-null` | 125 |
| `source-undefined` | 271 |
| `source-unknown` | 4276 |
| `standard-toolkit-boundary` | 21154 |
| `unclassified` | 487 |
