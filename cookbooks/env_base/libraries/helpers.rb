require_relative 'artifactory_helper'

class Chef
  class Recipe

    include ArtifactoryHelper

    def get_artifact_url(source, repository, group_id, artifact_id, version, extension, classifier=nil)
      source_url = ""

        if node['env_base']['repository'].nil?
          af_repository=repository
        else
         af_repository=node['env_base']['repository']
        end
        log "Deploying from artifactory repo #{af_repository}"
        artifactory=data_bag_item('common','artifactory')

          artifact_version= version == 'latest' ? get_artifactory_latest_version(artifactory['url'], "#{af_repository}", group_id, artifact_id, extension) : version
          artifact_war= get_artifactory_latest_war(artifactory['url'], "#{af_repository}", group_id, artifact_id, extension)
        classifier_str = ""
        if !classifier.nil?
          classifier_str = "-#{classifier}"
        end

        source_url = "#{artifactory['url']}/#{af_repository}/#{group_id.gsub('.','/')}/#{artifact_id}/#{artifact_version}/#{artifact_id}-#{artifact_war}.#{extension}"
        log "Deploying from artifactory version #{source_url}"

      source_url
    end



  end
end