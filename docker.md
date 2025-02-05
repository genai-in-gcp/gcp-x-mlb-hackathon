Build docker image:

```sh
sudo service docker restart
docker build -t streamlit-app .
```

Run docker image locally:
```sh
docker run streamlit-app
```

Deployment to Google Cloud:

One-time in Google Cloud Shell or locally (provided gcloud is installed):
```sh
gcloud services enable run.googleapis.com --project gcp-x-mlb-hackathon
gcloud services enable containerregistry.googleapis.com --project gcp-x-mlb-hackathon
gcloud auth configure-docker europe-west3-docker.pkg.dev
```
Note: docker-repo created manually in Artifact Registry:<br>
https://console.cloud.google.com/artifacts/docker/gcp-x-mlb-hackathon/europe-west3/docker-repo?inv=1&invt=AbnQbQ&project=gcp-x-mlb-hackathon


Everytime after rebuilding docker image:
```sh
docker tag streamlit-app europe-west3-docker.pkg.dev/gcp-x-mlb-hackathon/docker-repo/streamlit-app
docker push europe-west3-docker.pkg.dev/gcp-x-mlb-hackathon/docker-repo/streamlit-app
```

This might be needed (TODO: re-check):
```sh
gcloud auth login
gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://europe-west3-docker.pkg.dev
```

Deploy to Cloud Run:
```sh
gcloud run deploy streamlit-app \
--image europe-west3-docker.pkg.dev/gcp-x-mlb-hackathon/docker-repo/streamlit-app \
--platform managed \
--region europe-west3 \
--project gcp-x-mlb-hackathon \
--port 8501 \
--allow-unauthenticated
```