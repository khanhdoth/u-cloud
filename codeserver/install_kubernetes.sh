apt update && sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt update
apt install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
kubectl version --client

#sudo apt update
#sudo apt install snapd
#sudo snap install microk8s --classic

# install KVM
## https://www.linuxtechi.com/install-configure-kvm-debian-10-buster/

## Check Whether Virtualization Extension is enabled or not
grep -E --color '(vmx|svm)' /proc/cpuinfo

## Install QEMU-KVM & Libvirt packages along with virt-manager
apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager
systemctl status libvirtd.service

## Start default network and add vhost_net module
virsh net-list --all
virsh net-start default
modprobe vhost_net
echo "vhost_net" | sudo  tee -a /etc/modules
lsmod | grep vhost
adduser khanh_doth libvirt
adduser root libvirt
sudo adduser khanh_doth libvirt-qemu
sudo adduser root libvirt-qemu
newgrp libvirt
newgrp libvirt-qemu
cp /home/khanh_doth/dev/git/u-cloud/codeserver/interfaces /etc/network/interfaces
ip addr flush ens4 && systemctl restart networking

# install minikube
curl -Lo minikube  https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
mkdir -p /usr/local/bin/
install minikube /usr/local/bin/
minikube start --driver=docker
minikube status

#reboot
