# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 30739 |
| Modules with erasure | 1509 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 615 |
| `nominal-factory-allocator` | 32 |
| `source-any` | 1298 |
| `source-never` | 194 |
| `source-null` | 282 |
| `source-undefined` | 550 |
| `source-unknown` | 4812 |
| `standard-toolkit-boundary` | 22094 |
| `unclassified` | 862 |
