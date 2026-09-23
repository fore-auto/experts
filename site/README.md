# Site

网站上线专家：把一个站点从「要不要备案」一路推到「搜索引擎能搜到」——托管与备案分流、对象存储与凭证、风格选型与脚手架、域名解析与 HTTPS、页面落地、部署挂靠与增量发布、SEO 辅料全套、站长平台提交与认证。

## 类型

Agent 型（单个 AI 专家）

## 功能

- **先决策后动手**：第 0 步三问（有无官网 / 访客在哪 / 站点性质）+ B1 托管与备案分流，差异摆给用户选。
- **三方案对照**：阿里云 OSS 中国内地（需 ICP 备案）/ 中国香港（免备案）/ Vercel（免备案，大陆可达性有风险）。
- **对象存储与凭证**：内置 `fore-vip-oss` 技能 —— 云厂商选择、官方 CLI 安装与版本判定、AK/SK 引导、自定义域名（CNAME）绑定。
- **建站与部署**：内置 `auto-site-builder` 技能 —— 三档风格脚手架、域名解析与 HTTPS、增量发布脚本、fail-closed 闸门。
- **SEO 全套**：title / description / canonical / OG / JSON-LD / robots.txt / sitemap.xml / 语义标签，逐项落文件不留待补。
- **提交与认证**：站长平台认证 + sitemap 提交 + 抓取状态复核。
- **存量站优化**：技术栈识别 → SEO 与文案体检 → 保留 / 优化 / 重建建议（带依据明细）。

## 内置技能

| 技能目录 | 技能发布源 | 版本 | 职责 |
|---|---|---|---|
| `skills/fore-vip-oss/` | `~/git/fore.vip/skills/fore-vip-oss` | 1.0.1 | 对象存储选型、官方 CLI 安装、AK/SK 凭证、自定义域名绑定 |
| `skills/auto-site-builder/` | `~/git/auto/skills/auto-site-builder` | 1.0.0 | 建站全流程：分流决策、脚手架、部署、SEO 辅料、站长平台提交 |

> Vercel 部署不做独立技能 —— 内容在 `auto-site-builder/references/hosting.md` §4，由该技能统一负责。

## 使用示例

- 我要建官网上线：先帮我做托管与备案分流决策（内地 OSS 备案 / 香港 OSS 免备案 / Vercel）
- 帮我把站点部署到阿里云 OSS 或 Vercel，配好自定义域名与 HTTPS
- 给站点生成全套 SEO 辅料并提交到各大站长平台，让搜索引擎能收录

## 头像

头像已自动生成在 `avatars/` 目录下。如需替换为自定义头像，要求：
- 格式：PNG（推荐）或 JPG
- 尺寸：512×512 px
- 大小：单张不超过 500KB

## 发布

本目录是**发布源**，不走本地覆盖安装。链路：上传开放平台（workbuddy.cn）→ WorkBuddy 市场 → 安装回测。约定见 `../README.md`。
