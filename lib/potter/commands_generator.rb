require "commander"

HighLine.track_eof = false

module Potter
  class CommandsGenerator
    include Commander::Methods

    def self.start
      new.run
    end

    def convert_options(options)
      o = options.__hash__.dup
      o.delete(:verbose)
      o
    end

    def run
      program :version, Potter::VERSION
      program :description, Potter::DESCRIPTION
      program :help, "Author", "Carlos Vidal <nakioparkour@gmail.com>"
      program :help, "Website", "http://www.nakiostudio.com"
      program :help, "GitHub", "https://github.com/nakiostudio/potter"
      program :help_formatter, :compact

      global_option("--verbose") { $verbose = true }

      command :tests do |c|
        c.syntax = "Potter"
        c.description = Potter::DESCRIPTION
        c.action do |args, options|
          puts args
          Potter::Manager.new.work(options)
        end
      end

      default_command :tests

      run!
    end
  end
end
