export PATH=$PATH:/opt/chef/embedded/bin/
cd /tmp/tig
berks vendor /etc/chef/cookbooks/
chef-solo
