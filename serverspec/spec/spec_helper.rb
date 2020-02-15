require 'serverspec'
require 'net/ssh'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

# EC2インスタンスに接続用のssh configファイルを明示的に指定する
options = Net::SSH::Config.for(host)

# SSH接続先を明示的に指定する
#options[:user] ||= Etc.getlogin
options[:user] = ENV['SERVERSPEC_SSH_USER']
options[:port] = ENV['SERVERSPEC_SSH_PORT']
options[:keys] = ENV['SERVERSPEC_SSH_PEM_FILE']

set :host,        options[:host_name] || host
set :ssh_options, options

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'
