# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 26758 |
| Modules with erasure | 1193 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 618 |
| `source-any` | 968 |
| `source-never` | 120 |
| `source-null` | 86 |
| `source-undefined` | 267 |
| `source-unknown` | 3894 |
| `standard-toolkit-boundary` | 20374 |
| `unclassified` | 431 |
