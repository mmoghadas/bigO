echo "configuring client..."

# Install and enable puppet client
sudo yum install -y puppet
sudo chkconfig puppet on

# # Setup puppet.conf
# cat <<EOF > /etc/puppet/puppet.conf
# [main]
#     logdir = /var/log/puppet
#     rundir = /var/run/puppet
#     ssldir = $vardir/ssl
#     certname = sg1
#     server = stargate
# 
# [agent]
#     classfile = $vardir/classes.txt
#     localconfig = $vardir/localconfig
# EOF

# Link host -> guest
ln -sf /vagrant/puppet/puppet.conf /etc/puppet/puppet.conf

# Start puppet client
sudo service puppet start

# add host entry for puppet server
# several ways of doing this i.e: Vagranfile/:inline
cat <<EOF >> /etc/hosts
192.168.33.101 stargate
EOF


