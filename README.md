# AI编程学习平台

基于 Vue3 + FastAPI + MySQL 的在线学习平台，支持视频课程、学习进度追踪和问答测验。

## 技术栈

- **前端**: Vue3 + Vite
- **后端**: FastAPI + SQLAlchemy
- **数据库**: MySQL
- **部署**: Nginx

## 快速开始

### 1. 数据库设置

```sql
CREATE DATABASE ai_learning CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 2. 后端

```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### 3. 前端

```bash
cd frontend
npm install
npm run dev
```

### 4. 访问

- 前端: http://localhost:3000
- 后端API: http://localhost:8000/api

## 项目结构

```
ai-learning-platform/
├── backend/
│   ├── main.py          # FastAPI入口
│   ├── models.py         # 数据库模型
│   ├── schemas.py        # Pydantic schemas
│   ├── crud.py          # 数据库操作
│   ├── database.py      # 数据库配置
│   └── requirements.txt
├── frontend/
│   ├── src/
│   │   ├── main.js     # Vue入口
│   │   ├── App.vue      # 根组件
│   │   └── views/       # 页面组件
│   ├── package.json
│   └── vite.config.js
└── README.md
```

## 功能

- [x] 课程列表
- [x] 课程详情/章节
- [ ] 视频嵌入播放
- [ ] 学习进度追踪
- [ ] 问答测验
- [ ] 错题本
