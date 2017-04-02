#
# Cookbook Name:: proj1
# Recipe:: deploy_wars
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
	tmp_war_dir = "#{Chef::Config['file_cache_path']}/deployments"

	directory tmp_war_dir do
		mode '0755'
		action :create
	end

	node['proj1']['deployments'].each do | deployable, coordinates |

		artifact_target_name = coordinates['context_root'].nil? ? coordinates['artifact_id'] : coordinates['context_root']
		war_file  = "#{artifact_target_name}.#{coordinates[:extension]}"

		if coordinates['url'].nil? || coordinates['url'].empty?

        	version = coordinates['version']
			source_url = get_artifact_url(coordinates['artifact_source'], coordinates['repository'], coordinates['group_id'], coordinates['artifact_id'], version, coordinates['extension'])
			log "Deploying #{deployable} version: #{source_url}"
      
      		#deploy artifact
			remote_file "#{tmp_war_dir}/#{war_file}" do
				backup false
				mode '0644'
				source source_url
			end
		elsif
			remote_file "#{tmp_war_dir}/#{war_file}" do
				backup false
				mode '0644'
				source coordinates['url']
			end
		end

			deploy_dir = "/opt/#{node['proj1']['wildfly_version']}/standalone/deployments"
			remote_file "#{deploy_dir}/#{war_file}" do
				owner owner
				group group
				mode '0644'
				source "file:///#{tmp_war_dir}/#{war_file}"
				action :create_if_missing
			end
	end