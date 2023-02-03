# Deploy and Access the Kubernetes Dashboard 

#STEP 1: The Dashboard UI is not deployed by default. To deploy it, run the following command:

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

#STEP 2: To obtain the Service Account Token , Create ServiceAccount:

kubectl -n kube-system create serviceaccount <service-account-name>

#STEP 3: Create ClusterRoleBinding and add an admin role (cluster-admin):

kubectl create clusterrolebinding <clusterrolebinding-name> --clusterrole=cluster-admin --serviceaccount=kube-system:<service-account-name>

#STEP 4: Get the secret name of the created ServiceAccount that stores the token:

export TOKENNAME=$(kubectl -n kube-system get serviceaccount/<service-account-name> -o jsonpath='{.secrets[0].name}')

#STEP 5: Get the token from the secret in base64, decode it and add to the TOKEN environment variable:

export TOKEN=$(kubectl -n kube-system get secret $TOKENNAME -o jsonpath='{.data.token}' | base64 --decode)

#STEP 6: Check the token health level, make a request to the Kubernetes API with the token in the "Authorization: Bearer <TOKEN-HERE>"

curl -k -H "Authorization: Bearer $TOKEN" -X GET "https://<KUBE-API-IP>:6443/api/v1/nodes" | json_pp

#STEP 7: Add the service account to kubeconfig:

kubectl config set-credentials <service-account-name> --token=$TOKEN

#STEP 8: Change the current context:

kubectl config set-context --current --user=<service-account-name>

#STEP 9: Perform a health check:

kubectl get no

#The updated kubeconfig will be located in the $HOME/.kube/config home directory, download the file and upload to the K8S Dashboard Login Page and You Will See The Informations and Metrics Of The Cluster
 

