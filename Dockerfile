# 選擇 Python 3.9 的基礎映像檔（可依實際需求調整版本）
FROM python:3.11-slim

# 設定容器內工作目錄
WORKDIR /app

# 複製專案所需的 requirements.txt 至容器內
COPY requirements.txt .

# 安裝所需的 Python 套件，含 google-adk 等相依套件
RUN pip install --no-cache-dir -r requirements.txt

# 複製整個專案目錄 (含 agent.py、app/ 等檔案)
COPY . /app

# 若需要對外提供 API，可視需求調整此埠
EXPOSE 8000

# 使用 adk api_server 作為容器啟動指令
CMD ["adk", "api_server"]
