require 'rexml/document'

# conf = { 'username' => 'ciadmin', 'password' => 'ciadmin', 'url' => 'http://mdc3vr1001:8081/nexus/', 'repository' => 'stellaCIsnapshots' }
# nexus = NexusCli::RemoteFactory.create(conf)
# doc = nexus.search_for_artifacts('com.macys.stars.workflow:WorkflowService:war:*-SNAPSHOT')
# xmldoc = REXML::Document.new(doc)
# xmldoc.elements.collect("search-results/data/artifact/version") { |v|  v.text }.reject { |v| v =~ /RC1-SNAPSHOT/ }.sort.last
module ArtifactoryHelper

    def get_artifactory_latest_version(url, repository, group_id, artifact_id, extension)
        require 'httpclient'
        group_id="#{group_id}".gsub('.','/')
        sourceUrl="#{url}/#{repository}/#{group_id}/#{artifact_id}/maven-metadata.xml"
        puts "Artifactory URL #{sourceUrl}"
        doc = Net::HTTP.get_response(URI.parse(sourceUrl)).body
        # xmldoc = REXML::Document.new(xml_data)
        # rootElement=xmldoc.root
        # puts xmldoc
        # versions=rootElement.elements["versioning"].elements["latest"].text
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
        # xmldoc = REXML::Document.new(xml_data)
        # rootElement=xmldoc.root
        # puts xmldoc
        # versions=rootElement.elements["versioning"].elements["latest"].text
        xmldoc = REXML::Document.new(doc)
        snapshots = xmldoc.elements.collect("metadata/versioning/snapshotVersions/snapshotVersion/value") { |v|  v.text }.select { |v| v =~ /[0-9]+\.[0-9]+(\.[0-9]+)?\-[0-9]+([0-9]+)?\.[0-9]+([0-9]+)?\-[0-9]$/ }
        snapshots.sort.last.to_s.concat('')
    end
end