Build docker image:

```shell
docker build -t streamlit-app .
```

Deployment to Google Cloud:

One-time in Google Cloud Shell or locally (provided gcloud is installed):
```shell
gcloud services enable run.googleapis.com
gcloud services enable containerregistry.googleapis.com
gcloud auth configure-docker europe-west3-docker.pkg.dev
```
Note: docker-repo created manually in Artifact Registry:<br>
https://console.cloud.google.com/artifacts/docker/gcp-x-mlb-hackathon/europe-west3/docker-repo?inv=1&invt=AbnQbQ&project=gcp-x-mlb-hackathon

Once in a while (until auth expires):
```shell
gcloud auth login
```

Everytime after rebuilding docker image:
```shell
docker tag streamlit-app europe-west3-docker.pkg.dev/gcp-x-mlb-hackathon/docker-repo/streamlit-app
docker push europe-west3-docker.pkg.dev/gcp-x-mlb-hackathon/docker-repo/streamlit-app
```
Deploy to Cloud Run:
```shell
gcloud run deploy streamlit-app \
--image europe-west3-docker.pkg.dev/gcp-x-mlb-hackathon/docker-repo/streamlit-app \
--platform managed \
--region europe-west3 \
--project gcp-x-mlb-hackathon \
--port 8501 \
--allow-unauthenticated
```