# google-adk-a2a-example

Google A2A Server 建置官方範例專案，使用 Google ADK (Agent Development Kit) 建立一個可透過 FastAPI 測試的本地代理伺服器。

## 如何運行？

### Step 1: 複製 `.env` 檔案範例
```bash
cp .env.template .env
```
> 建議：請勿將 `.env` 檔案加入版本控制，避免洩漏機敏資訊。

### Step 2: 編輯 `.env`，設定 API 金鑰
```dotenv
# If using Gemini via Google AI Studio
GOOGLE_GENAI_USE_VERTEXAI="False"
GOOGLE_API_KEY="paste-your-actual-key-here"

# # If using Gemini via Vertex AI on Google Cloud
# GOOGLE_CLOUD_PROJECT="your-project-id"
# GOOGLE_CLOUD_LOCATION="your-location"  # e.g. us-central1
# GOOGLE_GENAI_USE_VERTEXAI="True"
```

### Step 3: 建置 Docker 映像檔
```bash
docker build -t simonliuyuwei/adk-server:v0.0.1 .
```

### Step 4: 執行 Docker 容器
```bash
docker run --rm -d --name google-adk-server -p 8000:8000 \
  --env-file .env \
  simonliuyuwei/adk-server:v0.0.1
```

## 本機測試 API 介面
啟動後，FastAPI Server 將於 `http://localhost:8000` 提供 API 服務。
你可以查看 `http://localhost:8000/docs` SwaggerUI 查看更多資訊。

## 注意事項
- 本範例使用 `adk api_server` 作為主要執行指令，已封裝於映像中。
- `.env.template` 僅提供結構，實際使用請填入正確金鑰。
- 若需支援 Vertex AI，請正確設定 Google Cloud 專案相關環境變數。

---

本專案為 Google 官方 A2A 架構學習範例，不建議直接用於生產環境，請依實際業務需求進行調整。