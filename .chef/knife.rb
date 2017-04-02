# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
ssl_verify_mode          :verify_none
log_location             STDOUT
node_name                "devops"
client_key               "#{current_dir}/devops.pem"
chef_server_url          "https://192.168.70.142/organizations/devopsdemo"
cookbook_path            ["#{current_dir}/../cookbooks"]

