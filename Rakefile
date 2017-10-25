require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:word_count_test) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
end

