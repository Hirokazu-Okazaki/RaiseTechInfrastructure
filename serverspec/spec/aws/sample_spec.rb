require 'spec_helper'

# Amazon Linux2 のためamazonを指定
current_os_family = "amazon"

# コンテナ名を指定(docker-composeで起動するデフォルトの名前を指定)
container_names = [
  'raisetechmysqlapp_app_1',
  'raisetechmysqlapp_web_1'
]

# ドメイン名
domain_name = "www.raisetechportfolio.tk"

describe 'docker' do
  # dockerが使用できること
  describe service('docker'), :if => os[:family] == current_os_family do
    it { should be_enabled }
    it { should be_running }
  end

  # docker-composeが使用できること
  describe command('docker-compose help') do
    its(:exit_status) { should eq 0 }
  end

  # コンテナが起動していること
  container_names.each { |container_name|
    describe docker_container(container_name) do
      it { should exist }
      it { should be_running }
    end
  }
end

describe host(domain_name) do
  # ドメイン名の名前解決
  it { should be_resolvable }
  it { should be_reachable }
end

describe command("curl -L https://#{domain_name} -o /dev/null -w '%{http_code}\n' -s") do
  # http_codeだけ抜き出してテスト 200:正常
  its(:stdout) { should match '200' }
end

describe 'listening port' do
  describe 'HTTP' do
    describe port(80) do
      it { should be_listening }
    end
  end

  describe 'SSH' do
    describe port(22) do
      it { should be_listening }
    end
  end
end

describe 'not listening port' do
  describe 'HTTPS' do
    # HTTPSで通信するのはロードバランサーまで
    # ロードバランサーからEC2への経路はHTTPで通信
    describe port(443) do
      it { should_not be_listening }
    end
  end
end
