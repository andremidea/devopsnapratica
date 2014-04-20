# encoding: utf-8
require 'puppet-lint/tasks/puppet-lint'
require 'rspec/core/rake_task'

PuppetLint.configuration.ignore_paths = ["librarian/**/*.pp"]

namespace :librarian do
  desc "Instala os modulos usando librarian puppet"
  task :install do
    Dir.chdir('librarian') do
      sh 'librarian-puppet install'
    end
  end
end


TESTED_MODULES = %w(mysql)
namespace :spec do
  TESTED_MODULES.each do |module_name|
    desc "Roda os testes do modulo #{module_name}"
	    RSpec::Core::RakeTask.new(module_name) do |t|
	      t.pattern = "modules/#{module_name}/spec/**/*_spec.rb"
	    end
  end
end 

desc "Roda todos os testes"
task :spec => TESTED_MODULES.map {|m| "spec:#{m}" }


desc "Cria pacote do puppet"
task :package => ['librarian:install', :spec] do
  sh "tar czvf puppet.tgz manifests modules librarian/modules"
end

desc "limpa pacote"
task :clean do
  sh "rm puppet.tgz"
end

task :default => [ :spec]

