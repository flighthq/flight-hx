# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 30179 |
| Modules with erasure | 1463 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 609 |
| `source-any` | 1288 |
| `source-never` | 181 |
| `source-null` | 255 |
| `source-undefined` | 515 |
| `source-unknown` | 4692 |
| `standard-toolkit-boundary` | 22025 |
| `unclassified` | 614 |
