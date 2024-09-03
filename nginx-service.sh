#1. Write the Service YAML File
vi nginx-service.yaml
#2. Apply the Service Configuration
kubectl apply -f nginx-service.yaml
#3. Verify the Service
kubectl get services
#4. Describe the Service
kubectl describe service cyber-knights-service
#5. Access the Service
Find Node IP Address: kubectl get nodes -o wide
#Access the Service
curl http://<node-ip>:30080
