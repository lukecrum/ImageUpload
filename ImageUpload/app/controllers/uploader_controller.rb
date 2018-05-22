class UploaderController < ApplicationController
  def upload
    file = params[:file]
    n = YAML.load_file('/var/www/html/filename.yml')
    name = n['name']
    n['name'] = n['name'] + 1
    File.open('/var/www/html/filename.yml', 'w') { |f| f.write n.to_yaml }
    FileUtils.mv(file.original_filename, "/var/www/html/images/#{file.original_filename}")
  end
end
