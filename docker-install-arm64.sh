echo "Wellcome to install docker via JETSKYTEC script"

echo "Uninstalling old version..."

sudo apt-get remove docker docker-engine docker.io containerd runc
echo "SUCCESS"

echo "Installing docker.."

sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "Installing docker engine..."

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "SUCCESS"

echo "Installing portainer.."
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
echo "SUCCESS"

echo "Well done! and Enjoy your self."