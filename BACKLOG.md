# Backlog

- TODO - test github CI to run autom 
- TODO - declare indexes in migrations

- provide batch insert methods for article (calibre), contact and ticket


Set up Mailtrap account**:
   - Sign up at [mailtrap.io](https://mailtrap.io)
   - Get your sandbox credentials for testing

3. **Configure environment variables**:
   ```bash
   export MAILTRAP_USERNAME="your_username"
   export MAILTRAP_PASSWORD="your_password"
   export ENVIRONMENT="development"
   ```

4. **Update dependencies**:
   ```bash
   cd packages/fence_service
   dart pub get
   ```

5. **Test the implementation**:
   ```bash
   dart test test/email_test.dart
   dart run example/email_config_example.dart