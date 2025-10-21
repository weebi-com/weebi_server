# BUILDME

__if dart upgrade adapt in Dockerfile__ (3.0.6 early 2025)

docker build -t server --progress=plain .
docker run -e PORT=8080 -e HTTP_PORT=8081 -t server
docker run -e PORT=8080 -e HTTP_PORT=8081 -p 8080:8080 -p 8081:8081 -it server

## for google cloud run

```shell
gcloud run deploy SERVICE_NAME \
  --image IMAGE_URL \
  --set-env-vars ENVIRONMENT=production \
  --set-env-vars HTTP_BASE_URL=https://prd.weebi.com \
  --set-env-vars PORT=8080 \
  --set-env-vars HTTP_PORT=8081 \
  --set-env-vars MONGO_DB_URI=your_mongodb_uri \
  --set-env-vars JWT_SECRET_KEY=your_secret
```

`gcloud run deploy`
`europe-west1`

**Required Environment Variables:**
- `ENVIRONMENT` - 'production' or 'development'
- `HTTP_BASE_URL` - Base URL for email callback links (e.g., https://prd.weebi.com)
- `PORT` - gRPC server port (default: 8080)
- `HTTP_PORT` - HTTP REST server port (default: 8081)
- `MONGO_DB_URI` - MongoDB connection string
- `JWT_SECRET_KEY` - Secret for JWT tokens

**Optional:**
- `MAILTRAP_API_TOKEN` - For production email
- `FROM_EMAIL` - Email sender address
- `FROM_NAME` - Email sender name
