# fastapi를 설치하는 user-data


data "template_file" "fastapi_userdata" {
  template = <<-EOF
    # FastAPI / Uvicorn 설치
    /home/ubuntu/miniconda3/bin/conda install -y python=3.10
    /home/ubuntu/miniconda3/bin/pip install fastapi uvicorn

    # 간단한 FastAPI 앱 생성
    cat <<EOL > /home/ubuntu/main.py
    from fastapi import FastAPI

    app = FastAPI()

    @app.get('/')
    def index():
        return {'Hello':'World!!'}
    EOL

    # FastAPI 앱 실행
    cat <<EOL > /etc/systemd/system/fastapi.service
    [Unit]
    Description=FastAPI app
    After=network.target

    [Service]
    User=ubuntu
    ExecStart=/home/ubuntu/miniconda3/bin/uvicorn main:app --host 0.0.0.0 --port 8000
    WorkingDirectory=/home/ubuntu
    Restart=always

    [Install]
    WantedBy=multi-user.target
    EOL

    # FastAPI 자동 시작 지정
    systemctl start fastapi
    systemctl enable fastapi
    EOF
}