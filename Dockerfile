# ベースイメージとして公式のRubyイメージを使用
FROM ruby:2.7.1

# 必要なライブラリをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# 作業ディレクトリを設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Gemをインストール
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . /myapp

# ポートを指定
EXPOSE 3000

# デフォルトのコマンドを指定
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]