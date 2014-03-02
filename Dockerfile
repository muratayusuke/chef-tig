FROM muratayusuke/chef-solo-berkshelf3

ENV LANG C.UTF-8

RUN mkdir -p /tmp/tig
ADD ./solo.rb /etc/chef/solo.rb
ADD ./node.json /etc/chef/node.json
ADD ./Berksfile /tmp/tig/Berksfile
ADD ./attributes /tmp/tig/attributes
ADD ./recipes /tmp/tig/recipes
ADD ./install_cmds.sh /tmp/tig/install_cmds.sh
ADD ./metadata.rb /tmp/tig/metadata.rb
ADD ./README.md /tmp/tig/README.md
RUN /tmp/tig/install_cmds.sh