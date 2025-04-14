# BUILDME

__if dart upgrade adapt in Dockerfile__ (3.0.6 early 2025)

docker build -t server --progress=plain .

docker run -e PORT=8080 -t server
docker run -e PORT=8080 -p 8080:8080 -it server

## for google cloud run

```shell
gcloud run deploy SERVICE_NAME \
  --image IMAGE_URL \
  --set-env-vars ENVIRONMENT=development
```

`gcloud run deploy`
`europe-west1`
