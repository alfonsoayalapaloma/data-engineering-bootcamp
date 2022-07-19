# gcloud container clusters get-credentials airflow-gke-data-bootcamp --zone us-central1-a --project capstone-356805

#airflow
cd  data-engineering-bootcamp/terraforms-templates/kubernetes
kubectl create namespace airflow
helm repo add apache-airflow https://airflow.apache.org
helm install airflow -f airflow-values.yaml apache-airflow/airflow --namespace airflow
kubectl get pods -n airflow

# kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow
#Default Webserver (Airflow UI) Login credentials:
#    username: admin
#    password: admin
#Default Postgres connection credentials:
#    username: postgres
#    password: postgres
#    port: 5432

