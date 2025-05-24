# Protocol Buffer Setup Guide

This guide will help you install Protocol Buffers compiler (protoc) and regenerate the proto files for the weebi_server project.

## Prerequisites

- WSL (Windows Subsystem for Linux) or Linux environment
- Dart SDK installed
- Git (for cloning protobuf repository if needed)

## Installation Steps

### Option 1: Using Package Manager (Recommended)

#### On Ubuntu/Debian (WSL):
```bash
# Update package list
sudo apt update

# Install protobuf compiler
sudo apt install protobuf-compiler

# Verify installation
protoc --version
```

#### On macOS:
```bash
# Using Homebrew
brew install protobuf

# Verify installation
protoc --version
```

### Option 2: Manual Installation

#### Download and Install Protoc:
```bash
# Create a directory for protoc
mkdir -p ~/tools/protoc
cd ~/tools/protoc

# Download latest protoc (adjust version as needed)
PROTOC_VERSION="25.1"
wget https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip

# Extract
unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip

# Add to PATH (add this to your ~/.bashrc or ~/.zshrc)
export PATH="$HOME/tools/protoc/bin:$PATH"

# Reload shell or source the profile
source ~/.bashrc

# Verify installation
protoc --version
```

## Setup Dart Protoc Plugin

```bash
# Reactivate the protoc plugin for Dart
dart pub global activate protoc_plugin

# Verify plugin is available
protoc --dart_out=. --version
```

## Generate Proto Files

Navigate to your project directory and run:

```bash
# Go to the weebi_server directory
cd /path/to/weebi_server

# Navigate to the protos directory
cd packages/protos

# Make the script executable (if not already)
chmod +x protos_weebi/tool/generate_protos.sh

# Run the generation script
bash protos_weebi/tool/generate_protos.sh
```

### Alternative: Manual Proto Generation

If the script doesn't work, you can run protoc manually:

```bash
# From packages/protos directory
protoc --dart_out=grpc:protos_weebi/lib/src/generated \
  -Iproto \
  common/address.proto \
  common/country.proto \
  common/empty.proto \
  common/chained_ids.proto \
  common/g_common.proto \
  common/g_timestamp.proto \
  common/phone.proto \
  article/article.proto \
  article/photo.proto \
  article/category.proto \
  article/article_service.proto \
  boutique.proto \
  btq_chain.proto \
  contact/contact.proto \
  contact/contact_service.proto \
  device.proto \
  firm.proto \
  user.proto \
  user_permissions.proto \
  fence_service.proto \
  ticket/ticket.proto \
  ticket/ticket_type.proto \
  ticket/ticket_service.proto \
  weebi_app_service.proto
```

## Verify Generated Files

After running the generation, verify that the new password reset methods are included:

```bash
# Check if the new RPC methods exist in the generated gRPC file
grep -n "requestPasswordReset\|confirmPasswordReset" protos_weebi/lib/src/generated/fence_service.pbgrpc.dart

# Check if the new message types exist
grep -n "PasswordResetRequest\|PasswordResetConfirmRequest" protos_weebi/lib/src/generated/fence_service.pb.dart
```

## Troubleshooting

### Plugin Error
If you get a plugin error:
```bash
# Remove and reinstall the plugin
dart pub global deactivate protoc_plugin
dart pub global activate protoc_plugin
```

### Path Issues
Make sure protoc is in your PATH:
```bash
which protoc
# Should return a path like /usr/bin/protoc or ~/tools/protoc/bin/protoc
```

### Permission Issues
If you get permission denied:
```bash
# Make sure the script is executable
chmod +x protos_weebi/tool/generate_protos.sh

# Or run with bash explicitly
bash protos_weebi/tool/generate_protos.sh
```

### WSL Specific Issues
If running in WSL, make sure you're not mixing Windows and Linux file systems:
```bash
# Check if you're in the correct file system
pwd
# Should start with /home/ or /mnt/c/ (avoid /mnt/c/ for best performance)
```

## Testing the Setup

After generation, you can test that everything works:

```bash
# Navigate to fence_service
cd ../fence_service

# Run pub get to ensure dependencies are resolved
dart pub get

# Try to compile (this will show any syntax errors)
dart analyze
```

## Next Steps

1. Once proto files are generated, update your dependencies:
   ```bash
   dart pub get
   ```

2. Test the email functionality by running the example:
   ```bash
   dart run example/email_config_example.dart
   ```

3. Set up your environment variables for email testing as described in EMAIL_SETUP.md

## Environment Variables for Email Testing

Create a `.env` file or set these environment variables:

```bash
# For development (Mailtrap sandbox)
export MAILTRAP_USERNAME="your_username_here"
export MAILTRAP_PASSWORD="your_password_here"
export ENVIRONMENT="development"

# For production (Mailtrap Send API)
# export MAILTRAP_API_TOKEN="your_api_token_here"
# export FROM_EMAIL="noreply@yourdomain.com"
# export FROM_NAME="Your App Name"
# export ENVIRONMENT="production"
```