namespace :generate_data do
  desc 'generate all data'
  task :all => :environment do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
    Rake::Task["generate_data:users"].execute
    Rake::Task["generate_data:recipes"].execute
  end
end