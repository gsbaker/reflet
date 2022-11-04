require 'yaml'

desc 'Create needs and save them to the database'

task :create_needs do
    needs_data = YAML.load_file('needs.yml')
    needs_data.each do |category, need|
        Need.new()
    end
end