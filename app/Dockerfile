# 使用するベースイメージを指定
FROM python:3.9-slim

# 作業ディレクトリを指定
WORKDIR /app

# app/ディレクトリ内のrequirements.txtをコンテナにコピー
COPY app/requirements.txt /app/
COPY app/app.py /app/

# 依存関係をインストール
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt

# アプリケーションコードをコンテナにコピー
COPY . /app/

# ポート5000番を公開
EXPOSE 80

# アプリケーションを実行
CMD ["python", "app.py"]
