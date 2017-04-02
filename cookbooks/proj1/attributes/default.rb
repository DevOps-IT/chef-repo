  default['proj1'].tap do | s |
# artifact attributes
  s['deployments']['proj1']['artifact_id'] = 'DevopsProj1'
  s['deployments']['proj1']['group_id'] = 'com.devops'
  s['deployments']['proj1']['version'] = 'latest'
  s['deployments']['proj1']['repository'] = 'DemoMavenRepo'
  s['deployments']['proj1']['extension'] = 'war'
  s['deployments']['proj1']['artifact_source'] = 'artifactory'
  s['wildfly_version'] = 'wildfly'
end