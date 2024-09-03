#1.Create the Namespace
kubectl create namespace ingress-nginx
#2. Apply the NGINX Ingress Controller Manifest
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
#3.Verify the Ingress Controller Deployment 
kubectl get pods --namespace=ingress-nginx
kubectl get services --namespace=ingress-nginx
#4. Create an Ingress Resource
vi ingress.yaml
#3. Apply the Ingress Configuration
kubectl apply -f ingress.yaml
#4. Verify the Ingress Resource
kubectl get ingress
#5.Describe  the Ingress resource
kubectl describe ingress cyber-knights-ingress --namespace=default
#6.Update /etc/hosts
<ingress-controller-ip> my-nginx.local
#7.Get ingress-controller-ip 
kubectl get services --namespace=ingress-nginx
#8.Test the Ingress Resource
curl -H "Host: my-nginx.local" http://<ingress-controller-ip>
#9. Check logs of the NGINX Ingress Controller
kubectl logs -l app.kubernetes.io/name=ingress-nginx --namespace=ingress-nginx
#10.Verify that your cyber-knights-service is healthy and reachable  by describing the service and its endpoints
kubectl describe service cyber-knights-service --namespace=default
kubectl get endpoints cyber-knights-service --namespace=default
