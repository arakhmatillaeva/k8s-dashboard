#kind cluster setup

#remove old version of docker 

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

# setup the docker repo
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#install docker engine 
sudo yum install -y docker-ce docker-ce-cli containerd.io

#start Docker Engine
sudo systemctl start docker
sudo systemctl enable docker



#install kubectl 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

#verfiy the installation
kubectl version --client



#Install Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/

#verif the installation 
kind --version

# create kind cluster
kind create cluster --name kind-cluster

#verify the cluster
kubectl cluster-info --context kind-kind-cluster
kubectl get nodes
