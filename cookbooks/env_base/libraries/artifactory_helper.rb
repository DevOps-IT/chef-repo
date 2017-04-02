require 'rexml/document'

module ArtifactoryHelper

    def get_artifactory_latest_version(url, repository, group_id, artifact_id, extension)
        require 'httpclient'
        group_id="#{group_id}".gsub('.','/')
        sourceUrl="#{url}/#{repository}/#{group_id}/#{artifact_id}/maven-metadata.xml"
        puts "Artifactory URL #{sourceUrl}"
        doc = Net::HTTP.get_response(URI.parse(sourceUrl)).body
        xmldoc = REXML::Document.new(doc)
        snapshots = xmldoc.elements.collect("metadata/versioning/versions/version") { |v|  v.text }.select { |v| v =~ /[0-9]+\.[0-9]+(\.[0-9]+)?\-SNAPSHOT$/ }
        versions = snapshots.collect {|v| Gem::Version.new(v.match(/(.+)?\-SNAPSHOT/)[1]) }
        versions.sort.last.to_s.concat('-SNAPSHOT')
    end

    def get_artifactory_latest_war(url, repository, group_id, artifact_id, extension)
        require 'httpclient'
        group_id="#{group_id}".gsub('.','/')
        artifact_version=get_artifactory_latest_version("#{url}", "#{repository}", "#{group_id}", "#{artifact_id}", "#{extension}")
        sourceUrl="#{url}/#{repository}/#{group_id}/#{artifact_id}/#{artifact_version}/maven-metadata.xml"
        puts "Artifactory URL #{sourceUrl}"
        doc = Net::HTTP.get_response(URI.parse(sourceUrl)).body
        xmldoc = REXML::Document.new(doc)
        snapshots = xmldoc.elements.collect("metadata/versioning/snapshotVersions/snapshotVersion/value") { |v|  v.text }.select { |v| v =~ /[0-9]+\.[0-9]+(\.[0-9]+)?\-[0-9]+([0-9]+)?\.[0-9]+([0-9]+)?\-[0-9]$/ }
        snapshots.sort.last.to_s.concat('')
    end
end