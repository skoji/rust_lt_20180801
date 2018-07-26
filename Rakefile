require 'nora_mark'
require 'nora_mark/rake_task'

NoraMark::RakeTask.new(lang: 'ja') do
  |task|
  task.page_number_digits = 3;
  task.title = 'Gitとはなにか'
  task.stylesheets = [ 'css/slide.css' ]
end

task :default => 'slide-nora_001.xhtml'
