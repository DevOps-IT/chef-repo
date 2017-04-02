java_ark "jdk1.8" do
  url "#{node['jdk18']['url']}"
  app_home '/usr/local/jdk1.8'
  bin_cmds ["java", "javac"]
  action :install
end

execute 'name' do
  command "rm -rf #{Chef::Config[:file_cache_path]}/jdk-8u121-linux-x64.tar.gz"
  action :run
  only_if { ::File.exist?("#{Chef::Config[:file_cache_path]}/jdk-8u121-linux-x64.tar.gz")}
end
