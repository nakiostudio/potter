# require "bundler/gem_tasks"
#
# Dir.glob("tasks/**/*.rake").each(&method(:import))
#
# task default: :spec

task :dev do
  sh "gem build potter.gemspec"
  sh "gem install potter-0.1.gem"
  sh 'potter tests'
end
