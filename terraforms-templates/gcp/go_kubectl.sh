gcloud components install gke-gcloud-auth-plugin
gcloud container clusters get-credentials airflow-gke-data-bootcamp --zone us-central1-a --project capstone-356805

#kubernetes:
cd data-engineering-bootcamp/terraforms-templates/gcp 
kubectl create namespace nfs
kubectl -n nfs apply -f nfs/nfs-server.yaml
export NFS_SERVER=$(kubectl -n nfs get service/nfs-server -o jsonpath="{.spec.clusterIP}")
kubectl create namespace storage
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --namespace storage \
    --set nfs.server=$NFS_SERVER \
    --set nfs.path=/

