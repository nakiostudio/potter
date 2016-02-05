require 'yaml'
require 'erb'

module Potter
  class Runner

    attr_accessor :target_class, :properties, :property, :mappings, :mapping

    def run
      read_yaml
    end

    def read_yaml
      classes = YAML.load(File.open(Potter.input))

      for target_class in classes
        file_extensions = {"swift" => "swift"}

        @target_class = target_class
        file_extension = file_extensions[Potter.language]
        File.open(File.join(Potter.output, "#{target_class.keys.first.to_s}.#{file_extension}"), "wb") do |file|
          properties = ""
          properties_dict = target_class[target_class.keys.first]
          properties_dict.each do |property|
            @property = property
            properties << template("property").result(binding)
          end
          @properties = properties
          file.puts template("class").result(binding)
        end
      end
    end

    def template(name)
      ERB.new(File.read(File.join(File.dirname(__FILE__), "../../views/#{Potter.language}", "#{name}.erb")))
    end
  end
end
