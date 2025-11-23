# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.12)
FROM dart:3.6.0 AS build

# Install protoc and git for proto generation
RUN apt-get update && \
    apt-get install -y protobuf-compiler git && \
    rm -rf /var/lib/apt/lists/*

# to check the path if needed use RUN pwd && ls

# Resolve app dependencies.
# Tell Docker that we'll be working in a directory called /app.
WORKDIR /app
# copies the pubspec.yaml & pubspec.lock into the container. 
COPY pubspec.* ./
# We run the command dart pub get to get dependencies. 
RUN dart pub get

# Install protoc-gen-dart plugin (pinned to version compatible with protobuf 4.0.0)
RUN dart pub global activate protoc_plugin 21.1.0 # protobuf < 5.0

# copy all the source code to the container.
COPY . .

# Generate proto files (this clones the proto repo and generates Dart code)
# Must be done after copying source code (script needs packages/protos/protos_weebi to exist)
# but before melos bootstrap to ensure generated files are up-to-date
# Ensure protoc-gen-dart is in PATH (from dart pub global activate protoc_plugin)
RUN chmod +x packages/protos/protos_weebi/tool/generate_protos.sh && \
    export PATH="$PATH:/root/.pub-cache/bin" && \
    packages/protos/protos_weebi/tool/generate_protos.sh

RUN dart pub global activate melos
# Ensure packages are still up-to-date if anything has changed
RUN melos bootstrap

# create an executable file at directory /bin called server. 
RUN dart compile exe apps/server/bin/server.dart -o apps/server/bin/server
# This will enable us to run the dart program by ./bin/server/

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build app/apps/server/bin/server app/apps/server/bin/
# Copy pubspec.yaml files needed for version information in health checks
# Files are copied to root level since working directory is typically / with FROM scratch
COPY --from=build app/apps/server/pubspec.yaml apps/server/
COPY --from=build app/packages/protos/protos_weebi/pubspec.yaml packages/protos/protos_weebi/
COPY --from=build app/packages/fence_service/pubspec.yaml packages/fence_service/
COPY --from=build app/packages/fence_service/pubspec.lock packages/fence_service/

# Start server.
# Expose gRPC port
EXPOSE 8080
CMD ["/app/apps/server/bin/server"]
