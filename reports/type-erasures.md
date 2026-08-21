# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 24501 |
| Modules with erasure | 1149 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 618 |
| `source-any` | 907 |
| `source-never` | 120 |
| `source-null` | 83 |
| `source-undefined` | 267 |
| `source-unknown` | 3868 |
| `standard-toolkit-boundary` | 18231 |
| `unclassified` | 407 |
