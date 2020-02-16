# README

RaiseTech講義用のAWS環境構築サンプルアプリケーション
- Terraform
- Serverspec

# Setup
EC2インスタンス上に環境構築を行う手順を記載する。
```sh
# yumのパッケージをアップデート
sudo yum update -y
# git, dockerのインストール
sudo yum install -y git docker
# dockerの起動      
sudo service docker start           
# ec2-userをdockerグループに入れる。これでec2-userがdockerコマンドを実行できる
sudo usermod -aG docker ec2-user
# dockerの起動確認
sudo docker info

# docker-compose(1.25.0)のインストール
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# ソースコードを取得
git clone https://github.com/Hirokazu-Okazaki/RaiseTechInfrastructure.git

cd RaiseTechInfrastructure
```

# Usage
- Terraform
```sh
# 環境変数ファイルの整備
mv .env.sample .env

# AWSの接続情報等を変更してください
vi .env

# Terraformによる環境構築
docker-compose run terraform apply

# Terraformによる環境削除
docker-compose run terraform destroy
```

- Serverspec
```sh
# 環境変数ファイルの整備
mv .env.sample .env

# SSHの接続情報等を変更してください
vi .env

# Terraformによる環境構築
docker-compose run serverspec rake
```

