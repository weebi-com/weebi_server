# BUILDME

__if dart upgrade adapt in Dockerfile__ (3.0.6 early 2025)

docker build -t server --progress=plain .
docker run -e PORT=8080 -t server
docker run -e PORT=8080 -p 8080:8080 -it server

## for google cloud run

### Deploy gRPC Service
```shell
gcloud run deploy weebi-grpc \
  --image IMAGE_URL \
  --region europe-west1 \
  --set-env-vars PORT=8080 \
  --set-env-vars MONGO_DB_URI=your_mongodb_uri \
  --set-env-vars JWT_SECRET_KEY=your_secret
```

**Required Environment Variables:**
- `PORT` - gRPC server port (default: 8080)
- `MONGO_DB_URI` - MongoDB connection string
- `JWT_SECRET_KEY` - Secret for JWT tokens

**Health Check:**
Use the `healthCheck` gRPC method for service health and version information.

**Note:**
HTTP REST server and email functionality have been removed from this service.
Password reset and email confirmation will be handled by a separate dedicated service.
