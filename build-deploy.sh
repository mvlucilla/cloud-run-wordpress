gcloud builds submit --tag us.gcr.io/gracia-digital/cloud-run-wordpress:latest
gcloud beta run deploy --image us.gcr.io/gracia-digital/cloud-run-wordpress:latest --add-cloudsql-instances mysql
gcloud beta run services delete wp
gcloud beta run deploy wp --image us.gcr.io/gracia-digital/cloud-run-wordpress:latest \
  --add-cloudsql-instances mysql \
  --update-env-vars DB_HOST='$(DB_HOST)',DB_NAME=$(DB_NAME),DB_USER=$(DB_USER),DB_PASSWORD=$(DB_PASSWORD),CLOUDSQL_INSTANCE='$(CLOUDSQL_INSTANCE)'
