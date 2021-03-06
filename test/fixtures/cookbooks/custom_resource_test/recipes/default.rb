directory "#{Chef::Config[:file_cache_path]}/private"

aws_kms 'default' do
  crypt_folder "#{Chef::Config[:file_cache_path]}/cookbooks/custom_resource_test/files/crypt"
  decrypt_folder "#{Chef::Config[:file_cache_path]}/private"
  action :decrypt
  # DO NOT DO THIS! This is for testing. It's pretty much a terrible idea.
  # If your setting your keys in code somewhere, and storing it in SCM, YOUR DOING IT WRONG.
  # Use IAM roles unless you really have to do this and have though it through.
  aws_access_key_id node['aws-kms']['aws_access_key_id']
  aws_secret_access_key node['aws-kms']['aws_secret_access_key']
  aws_security_token node['aws-kms']['aws_security_token']
end
