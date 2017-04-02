default['jdk18']['url'] = "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz"
default['env_base']['java_bin'] = '/usr/local/jdk1.8/bin/'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['wildfly']['version'] = '10.1.0'
default['wildfly']['url'] = 'http://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.tar.gz'
default['wildfly']['base'] = '/opt/wildfly'
default['wildfly']['install_java'] = false
default['wildfly']['mode'] = 'standalone'

default['wildfly']['int']['mgmt']['bind'] = '0.0.0.0'
default['wildfly']['int']['mgmt']['http_port'] = '9990'
default['wildfly']['int']['mgmt']['https_port'] = '9993'
 
default['wildfly']['int']['pub']['bind'] = '0.0.0.0'
default['wildfly']['int']['pub']['http_port'] = '8080'
default['wildfly']['int']['pub']['https_port'] = '8443'
 
default['wildfly']['int']['wsdl']['bind'] = '0.0.0.0'
default['wildfly']['int']['ajp']['port'] = '8009'
default['platform_family'] = 'rhel'

default['stars_common']['artifact_source'] = 'artifactory'
default['stars_common']['artifactory_url'] = 'http://192.168.70.144:8082/artifactory'