# Backlog

- TODO - use github CI to run autom - > https://shorebird.dev/blog/introducing-shorebird-ci/
- TODO - declare indexes in migrations


- provide batch insert methods for article (calibre), contact and ticket


Set up Mailtrap account**:
   - Sign up at [mailtrap.io](https://mailtrap.io)
   - Get your sandbox credentials for testing

1. **Configure environment variables**:
   ```bash
   export MAILTRAP_DEV_USERNAME="your_username"
   export MAILTRAP_DEV_PASSWORD="your_password"
   export ENVIRONMENT="development"
   ```

2. **Update dependencies**:
   ```bash
   cd packages/fence_service
   dart pub get
   ```

3. **Test the implementation**:
   ```bash
   dart test test/email_test.dart
   dart run example/email_config_example.dart

