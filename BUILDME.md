# BUILDME

if dart upgrade adapt in Dockerfile


> default
melos bootstrap
melos run analyze
melos clean

> scritped in yaml
melos test

> setting environment ?

docker build -t server --progress=plain .

docker run -e PORT=8080 -t server
docker run -e PORT=8080 -p 8080:8080 -it server

gcloud run deploy
europe-west1

