require 'rake'
require 'rake/testtask'
require 'lotus/rake_tasks'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test
