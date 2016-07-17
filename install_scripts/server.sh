echo "configuring puppet server..."

# Install and enable puppet service
sudo yum install -y puppet-server
sudo chkconfig puppetmaster on

# # Setup puppet.conf
# cat <<EOF > /etc/puppet/puppet.conf
# [main]
#     logdir = /var/log/puppet
#     rundir = /var/run/puppet
#     ssldir = $vardir/ssl
# 
# [agent]
#     classfile = $vardir/classes.txt
#     localconfig = $vardir/localconfig
#     
# [master]
#     dns_alt_names = stargate
#     autosign = true
# EOF

# Link host -> guest
ln -sf /vagrant/puppetmaster/puppet.conf /etc/puppet/puppet.conf
ln -sf /vagrant/puppetmaster/site.pp /etc/puppet/manifests/site.pp
rm -rf /etc/puppet/modules
ln -sf /vagrant/puppetmaster/modules /etc/puppet/modules

# Start puppetmaster
sudo service puppetmaster start