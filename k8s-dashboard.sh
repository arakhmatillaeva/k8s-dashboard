#1. Deploy the Kubernetes Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
#2. Create a Service Account for Dashboard Access
kubectl create serviceaccount dashboard-admin-sa -n kubernetes-dashboard
#3. Bind the Service Account to the ClusterRole
kubectl create clusterrolebinding dashboard-admin-sa-binding \
#4.Verify the Service Account
kubectl get serviceaccount dashboard-admin-sa -n kubernetes-dashboard
kubectl get clusterrolebinding dashboard-admin-sa-binding
#5. Obtain the Bearer Token for Authentication
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep dashboard-admin-sa | awk '{print $1}')
#Look for secrets
kubectl get secrets -n kubernetes-dashboard
#Retrieve the Token
kubectl describe secret dashboard-admin-sa-token -n kubernetes-dashboard
#Generate the token
kubectl -n kubernetes-dashboard create token admin-user
#5. Access the Kubernetes Dashboard
kubectl proxy
#6. Login to the Dashboard
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
#7.Use the token to log in


