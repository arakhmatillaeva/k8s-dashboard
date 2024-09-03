# Kind Cluster Setup

# Remove old version of Docker
sudo yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

# Setup the Docker repository
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker Engine
sudo yum install -y docker-ce docker-ce-cli containerd.io

# Start Docker Engine
sudo systemctl start docker
sudo systemctl enable docker

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Verify kubectl installation
kubectl version --client

# Install Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/

# Verify Kind installation
kind --version

# Create Kind configuration file
cat <<EOF > kind-config.yaml
apiVersion: kind.x-k8s.io/v1alpha4
kind: Cluster
metadata:
  name: cyber-knights
spec:
  nodes:
  - role: control-plane
  - role: worker
  - role: worker
EOF

# Create the Kind cluster using the configuration file
kind create cluster --name cyber-knights --config kind-config.yaml

# Verify the cluster
kubectl cluster-info --context kind-cyber-knights
kubectl get nodes

# Pull the Nginx Docker image
docker pull nginx:latest

# Load the Nginx image into the Kind cluster
kind load docker-image nginx:latest --name cyber-knights
