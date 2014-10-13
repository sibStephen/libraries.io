class Repositories
  class Emacs < Base
    HAS_VERSIONS = false

    def self.project_names
      projects.keys.sort
    end

    def self.projects
      @projects ||= HTTParty.get("http://melpa.milkbox.net/archive.json").parsed_response
    end

    def self.project(name)
      projects[name].merge({"name" => name})
    end

    def self.mapping(project)
      {
        :name => project["name"],
        :description => project["desc"]
        :homepage => project["props"]["url"],
        :keywords => project["props"]["keywords"]
      }
    end

    # TODO repo
  end
end
