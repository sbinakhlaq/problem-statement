require 'rspec/core/rake_task'
require 'cucumber/rake/task'

desc 'Create tasks to run unit tests'

RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = './spec/unit/{,/*/**}/*_spec.rb'
end


desc 'Create tasks to run unit tests'

RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = './spec/lib/{,/*/**}/*_spec.rb'
end

Cucumber::Rake::Task.new

desc 'Default: run specs and generate metrics'

namespace :coverage do
  desc ""
  task :unit do
    ENV["COVERAGE"] = "disable"
    Rake::Task['unit'].invoke
  end

  task :feature do
    ENV["COVERAGE"] = "enable"
    sh 'cucumber'
  end
end

task :default => ["coverage:unit", "coverage:feature"]
