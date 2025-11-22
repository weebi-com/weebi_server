# protos_weebi

Dart package containing generated code from proto files.

## Proto Source

Proto files are fetched from: https://github.com/weebi-com/protos

## Generating Code

To regenerate Dart code from proto files:

```bash
cd packages/protos/protos_weebi
bash tool/generate_protos.sh
```

The script will:
1. Clone or update the proto repository from GitHub
2. Generate Dart code using `protoc`
3. Output generated files to `lib/src/generated/`

## Dependencies

This package depends on:
- `protobuf: ^4.0.0`
- `grpc: ^4.0.1`
- `fixnum: ^1.1.1`
- `crypto: ^3.0.3`

## troubleshooting

To use a specific version:
Tag the protos repo: git tag v1.0.0 && git push origin v1.0.0
Update both .protos-version files:
   PROTOS_VERSION=1.0.0   PROTOS_COMMIT=v1.0.0
Run the generation scripts — they'll check out that tag

.\scripts\check_protos_version.ps1
