unless system('git --version') == 0
  include_recipe 'git'
end

pkgs = %w{libncurses5-dev}
pkgs.each do |pkg|
  package pkg
end

execute "Extracting and Building tig #{node['tig']['version']} from Source" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    git clone #{node['tig']['url']}
    cd tig
    make prefix=#{node['tig']['prefix']}
    make install
  COMMAND
  creates "#{node['tig']['prefix']}/bin/tig"
  not_if "#{node['tig']['prefix']}/bin/tig -v | grep #{node['tig']['version']}"
end
