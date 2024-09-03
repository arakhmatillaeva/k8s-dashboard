#1. Deploy the Kubernetes Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
#2. Create a Service Account for Dashboard Access
kubectl create serviceaccount admin-user -n kubernetes-dashboard
#3. Bind the Service Account to the ClusterRole
kubectl create clusterrolebinding admin-user-binding --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:admin-user
#4. Obtain the Bearer Token for Authentication
kubectl get serviceaccount admin-user -n kubernetes-dashboard -o jsonpath='{.secrets[0].name}'
#Generate the token
kubectl -n kubernetes-dashboard create token admin-user
#5. Access the Kubernetes Dashboard
kubectl proxy
#6. Login to the Dashboard
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
#7.Use the token to log in


