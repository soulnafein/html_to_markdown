require "bundler/gem_tasks"
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['tests/**/*_tests.rb']
  t.verbose = true
end
