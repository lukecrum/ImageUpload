include 'sudo'
class UploaderController < ApplicationController
  def uploader
  end
  def upload_file
    file = params["Photo"][:file]
    n = YAML.load_file('/var/www/html/filename.yml')
    name = n['name']
    new_name = name.to_s + File.extname(file.original_filename)
    n['name'] = n['name'] + 1
    Sudo::Wrapper.run do |sudo|
      sudo[File].open('/var/www/html/filename.yml', 'w') { |f| f.write n.to_yaml }
      sudo[File].open("/var/www/html/images/#{new_name}", 'w+')
      sudo[File].rename(file.original_filename, "/var/www/html/images/#{new_name}")
    end
  end
end
