-- AI Learning Platform - Seed Data
-- Usage: mysql -u root -p'YOUR_PASSWORD' ai_learning < seed.sql

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Clear existing data
TRUNCATE progress;
DELETE FROM questions;
DELETE FROM chapters;
DELETE FROM courses;
ALTER TABLE courses AUTO_INCREMENT = 1;
ALTER TABLE chapters AUTO_INCREMENT = 1;
ALTER TABLE questions AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- Course 1: AI编程基础
-- ============================================
INSERT INTO courses (id, title, category, description, order_index) VALUES
(1, 'AI编程基础', 'ai_basic', '学习Claude Code和AI协作编程的核心技能，从入门到精通。', 1);

INSERT INTO chapters (id, course_id, title, video_url, content, order_index) VALUES
(1, 1, '1.1 Claude Code是什么', '',
'# Claude Code 是什么？

Claude Code 是 Anthropic 推出的 AI 编程助手命令行工具，可以直接在终端中帮你编写代码、调试问题、重构项目。

## 核心能力

- **代码生成**：根据自然语言描述生成完整代码
- **代码审查**：自动发现 bug 和安全隐患
- **项目理解**：分析整个代码库，理解架构和依赖关系
- **多语言支持**：支持 Python、JavaScript、TypeScript、Go、Rust、C++ 等
- **自动化任务**：批量重命名、格式化、生成测试用例

## 与传统 IDE 的区别

传统 IDE 插件只能在编辑器内提供建议，而 Claude Code 可以直接操作文件系统、执行命令、管理 Git，是一个完整的开发伙伴。',
1),

(2, 1, '1.2 安装和配置', '',
'# 安装和配置 Claude Code

## 系统要求

- macOS、Linux 或 Windows
- Node.js 18+
- Git

## 安装

```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

## 首次配置

1. 注册 Anthropic API 密钥
2. 设置环境变量: `export ANTHROPIC_API_KEY=your-key`
3. 在项目目录运行 `claude`

## CLAUDE.md

在项目根目录创建 CLAUDE.md 文件存储项目规范和自定义指令，AI 每次会话都会读取。',
2),

(3, 1, '1.3 Prompt 工程基础', '',
'# Prompt 工程基础

好的 Prompt 是高效使用 AI 的关键。

## 黄金法则

### 1. 明确具体
- 差的 Prompt："帮我写个登录功能"
- 好的 Prompt："用 Express 写一个登录接口，支持邮箱+密码登录，JWT token，包含输入验证"

### 2. 提供上下文
告诉 AI 项目背景、技术栈、代码风格，让 AI 给出更精准的建议。

### 3. 分步骤进行
把复杂任务拆分成小步骤，逐步推进。

### 4. 给出示例
提供输入输出示例，帮助 AI 理解你的期望。

## Prompt 模板

```
## 任务
[描述你要做什么]

## 背景
[项目背景、现有架构]

## 要求
- [具体要求 1]
- [具体要求 2]

## 示例
[输入输出示例]

## 约束
- [技术限制]
- [代码规范]
```

## 常见错误

1. **太模糊**：AI 的回答质量取决于问题的清晰度
2. **一次性要求太多**：一个 prompt 只做一件事
3. **不检查输出**：AI 会犯错，务必审查生成的代码',
3),

(4, 1, '1.4 AI 协作编程实战', '',
'# AI 协作编程实战

## 工作流模式

### 探索-实现-审查
1. **探索**：让 AI 分析代码库，理解现有逻辑
2. **实现**：让 AI 按需求编写代码
3. **审查**：让 AI 自查代码质量和潜在问题

### 测试驱动开发
让 AI 先写测试用例，再实现功能代码。

## 实用技巧

- 代码生成："在 src/utils 下创建 date.ts，导出 formatDate 和 parseDate"
- Bug 修复："登录后页面空白，帮我排查 src/auth 目录"
- 重构："把回调风格改成 async/await"
- 文档："给 Table 组件生成使用文档"

## 最佳实践

1. **小步提交**：每完成一个功能就 git commit
2. **保持专注**：一个会话聚焦一个任务
3. **善用 CLAUDE.md**：将项目规范写入 CLAUDE.md
4. **定期总结**：要求 AI 总结当前进度和下一步',
4),

(5, 1, '1.5 代码审查与优化', '',
'# 代码审查与优化

Claude Code 可以帮你做专业的代码审查。

## 审查维度

### 安全
- SQL 注入风险
- XSS 漏洞
- 敏感信息泄露
- 权限控制缺失

### 性能
- 数据库 N+1 问题
- 不必要的重复计算
- 内存泄漏风险

### 质量
- 命名规范
- 函数复杂度
- 代码重复
- 错误处理

## 使用方式

```
"审查 src/services/user.ts 的代码质量"
"审查当前分支和 main 的所有差异"
"扫描项目中的 OWASP Top 10 漏洞"
```

## 处理反馈

1. 评估优先级：区分严重 bug 和风格建议
2. 逐项验证：人工确认每个建议
3. 针对性修复：先修安全问题，再修逻辑 bug',
5);

INSERT INTO questions (id, chapter_id, type, question, options, answer, explanation) VALUES
(1, 1, 'single', 'Claude Code 是什么？',
 '["A. 在线代码编辑器","B. AI 编程助手命令行工具","C. 数据库管理工具","D. 版本控制工具"]',
 'B', 'Claude Code 是 Anthropic 推出的 AI 编程助手命令行工具。'),
(2, 1, 'judge', 'Claude Code 只能支持 Python 语言。',
 '["正确","错误"]',
 '错误', 'Claude Code 支持 Python、JavaScript、TypeScript、Go、Rust、C++ 等多种语言。'),

(3, 2, 'single', '安装 Claude Code 需要哪个运行时？',
 '["A. Python 3.8+","B. Java 11+","C. Node.js 18+","D. Go 1.20+"]',
 'C', 'Claude Code 基于 Node.js，需要 18 以上版本。'),
(4, 2, 'judge', 'CLAUDE.md 文件用于存储项目规范和自定义指令。',
 '["正确","错误"]',
 '正确', 'CLAUDE.md 是 Claude Code 的项目配置文件，每次会话都会读取。'),

(5, 3, 'single', '好的 Prompt 最重要的特征是？',
 '["A. 尽可能长","B. 使用专业术语","C. 明确具体","D. 包含代码示例"]',
 'C', '明确具体是好 Prompt 的必要条件。'),
(6, 3, 'multi', '以下哪些是 Prompt 工程的常见错误？（多选）',
 '["A. 太模糊","B. 一次性要求太多","C. 不检查输出","D. 提供太多上下文"]',
 'A,B,C', '太模糊、一次要求太多、不检查输出都是常见错误。'),

(7, 4, 'single', 'AI 协作编程推荐的流程是？',
 '["A. 直接实现后提交","B. 探索-实现-审查循环","C. 写需求后审查再实现","D. 实现后测试再提交"]',
 'B', '探索-实现-审查循环是最佳实践。'),
(8, 4, 'judge', '使用 AI 编程时应该一次性完成所有功能再提交。',
 '["正确","错误"]',
 '错误', '应该小步提交，每完成一个小功能就 git commit。'),

(9, 5, 'single', '收到 AI 审查意见后首先应该做什么？',
 '["A. 立即修改所有问题","B. 忽略所有建议","C. 评估优先级，区分严重 bug 和风格建议","D. 让 AI 直接修改"]',
 'C', '先评估优先级，再逐项处理。'),
(10, 5, 'multi', 'Claude Code 代码审查包含哪些维度？（多选）',
 '["A. 安全检查","B. 性能优化","C. 代码质量","D. 员工绩效"]',
 'A,B,C', '代码审查包括安全、性能、质量三个维度。');

-- ============================================
-- Course 2: Python爬虫实战 (placeholder)
-- ============================================
INSERT INTO courses (id, title, category, description, order_index) VALUES
(2, 'Python爬虫实战', 'crawler', '学习数据采集与反爬技术，从入门到进阶。', 2);

INSERT INTO chapters (id, course_id, title, video_url, content, order_index) VALUES
(6, 2, '2.1 爬虫基础与环境搭建', '',
'# 爬虫基础与环境搭建

## HTTP 协议基础

- 请求方法：GET / POST
- 请求头：User-Agent、Cookie、Referer
- 响应状态码：200、301、403、404、500

## Python 环境

```bash
pip install requests beautifulsoup4 lxml scrapy
```

## 第一个爬虫

```python
import requests
from bs4 import BeautifulSoup

url = "https://example.com"
headers = {"User-Agent": "Mozilla/5.0"}
resp = requests.get(url, headers=headers)
soup = BeautifulSoup(resp.text, "lxml")
print(soup.title.text)
```

## 爬虫三要素

1. **网络请求**：获取网页内容
2. **数据解析**：提取目标信息
3. **数据存储**：保存到文件或数据库',
1);

-- ============================================
-- Course 3: 程序员接单指南 (placeholder)
-- ============================================
INSERT INTO courses (id, title, category, description, order_index) VALUES
(3, '程序员接单指南', 'freelance', '学习如何通过接单平台获取项目和收入。', 3);

INSERT INTO chapters (id, course_id, title, video_url, content, order_index) VALUES
(7, 3, '3.1 接单平台与项目筛选', '',
'# 接单平台与项目筛选

## 主流平台

| 平台 | 特点 | 适合人群 |
|------|------|----------|
| 猿急送 | 远程项目，价格透明 | 中高级开发者 |
| 程序员客栈 | 国内最大接单平台 | 全栈开发者 |
| 猪八戒 | 项目量大，竞争多 | 设计+开发 |

## 项目筛选原则

1. **匹配技术栈**：只投自己擅长的
2. **评估时间**：预留 20% buffer
3. **看预算**：不接严重偏低的项目
4. **看需求**：优先有明确描述的项目

## 报价策略

- 按工时估算 × 时薪
- 复杂项目加 30% 风险溢价
- 明确交付物和验收标准',
1);

SELECT 'Seed data loaded!' AS status;
SELECT id, title, (SELECT COUNT(*) FROM chapters WHERE course_id=courses.id) AS chapters FROM courses;
