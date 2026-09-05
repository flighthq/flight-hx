# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 30379 |
| Modules with erasure | 1513 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 622 |
| `nominal-factory-allocator` | 44 |
| `source-any` | 1271 |
| `source-never` | 168 |
| `source-null` | 153 |
| `source-undefined` | 332 |
| `source-unknown` | 4838 |
| `standard-toolkit-boundary` | 22180 |
| `unclassified` | 771 |
