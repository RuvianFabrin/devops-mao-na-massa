#/bin/sh
sudo yum -y install epel-release
echo "Inicio da instalacao do ansible"
sudo yum -y install ansible
cat <<EOT >> /etc/hosts
192.168.4.12 control-node
192.168.4.13 app01
192.168.4.14 db01
EOT