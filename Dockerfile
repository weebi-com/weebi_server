# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.12)
FROM dart:stable AS build

# to check the path if needed use RUN pwd && ls

# Resolve app dependencies.
# Tell Docker that we'll be working in a directory called /app.
WORKDIR /app
# copies the pubspec.yaml & pubspec.lock into the container. 
COPY pubspec.* ./
# We run the command dart pub get to get dependencies. 
RUN dart pub get

# copy all the source code to the container.
COPY . .
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

# Start server.
EXPOSE 8080
CMD ["/app/apps/server/bin/server"]
