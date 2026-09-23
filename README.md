# fore.vip · WorkBuddy 专家包发布源

**WorkBuddy AI Agent 专家包（Expert Package）的发布源与版本仓库。** 收录面向「内容增长」「网站上线」「B2B 获客」「产品选型」的可安装专家，每个专家包内置可移植技能，经 WorkBuddy 开放平台发布后分发至 WorkBuddy 专家市场。

本目录是**唯一权威版本（source of truth）**，与 `skills/` 平级 —— 改内容只改这里。

> **关键词**：WorkBuddy 专家 · AI Agent 专家包 · Expert Package · GEO 内容自动化 · 生成式引擎优化 · 多平台稿件生成 · 网站上线 · 静态站点托管 · 阿里云 OSS 部署 · Vercel 部署 · SEO 审计 · 站长平台提交 · B2B 获客 · 客户挖掘 · 销售线索 · 产品调研 · 选型对比 · 采购决策

---

## 专家清单

| 目录 | 专家 `name` | 定位 | 分类 | 版本 |
|---|---|---|---|---|
| [`geo/`](./geo) | `geo` | **GEO 内容自动化专家**：产品 / 类目 → 多平台文章 + 主题页，品牌自然嵌入、广告法合规 | `05-MarketingGrowth` | 1.0.0 |
| [`site/`](./site) | `site` | **网站上线专家**：托管与备案分流 → OSS / Vercel 部署 → 域名与 HTTPS → SEO 辅料与站长平台提交 | `02-Engineering` | 1.0.0 |
| [`find-customers/`](./find-customers) | `find-customers` | **B2B 获客专家**：需求锁定 → 产业链下游分析 → 多源客户采集 → 线索暂存 → 邮件直推 / 发布获客 | `07-SalesCommerce` | 1.0.0 |
| [`find-products/`](./find-products) | `find-products` | **产品调研顾问**：需求澄清 → 维度赋权 → 多渠道调研 → 加权评分对比 → 首选与避坑清单 | `07-SalesCommerce` | 1.0.0 |

四位专家内置技能与技能发布源**同源同内容**：

| 专家 | 内置技能 | 技能发布源 | 版本 |
|---|---|---|---|
| `geo/` | `skills/auto-geo/` | `~/git/auto/skills/auto-geo/`（`fore-vip-geo-optimizer`） | — |
| `site/` | `skills/fore-vip-oss/` | `~/git/fore.vip/skills/fore-vip-oss/` | 1.0.1 |
| `site/` | `skills/auto-site-builder/` | `~/git/auto/skills/auto-site-builder/` | 1.0.0 |
| `find-customers/` | `skills/auto-find-customers/` | `~/git/auto/skills/auto-find-customers/` | 2.2.1 |
| `find-products/` | `skills/fore-vip-product/` | `~/git/fore.vip/skills/fore-vip-product/` | 1.0.0 |

> 灌入技能源时**剔除 `_meta.json`** 等发布产物（属打包元数据，非技能本体），与既有专家保持一致。

## 仓库结构

```
experts/
├── geo/                                   # GEO 内容自动化专家
│   ├── .codebuddy-plugin/plugin.json       # 专家元数据（name / agentName / categoryId / 入口声明）
│   ├── agents/geo.md                       # 专家人设与 SOP 编排
│   ├── avatars/expert.png                  # 专家头像（512×512）
│   └── skills/auto-geo/                    # 内置技能：GEO 写作流水线 + 问句库 / 平台库 / B 端渠道库
├── site/                                  # 网站上线专家
│   ├── .codebuddy-plugin/plugin.json
│   ├── agents/site.md
│   ├── avatars/expert.png
│   └── skills/
│       ├── fore-vip-oss/                   # OSS 厂商选型 / CLI 安装 / AK-SK / 自定义域名
│       └── auto-site-builder/              # 脚手架 / 部署脚本 / SEO 辅料 / 站长平台提交
├── find-customers/                        # B2B 获客专家
│   ├── .codebuddy-plugin/plugin.json
│   ├── agents/find-customers.md
│   ├── avatars/expert.png
│   └── skills/auto-find-customers/         # F0–F6 流水线 + 发布渠道库 / CRM 接口
└── find-products/                         # 产品调研顾问
    ├── .codebuddy-plugin/plugin.json
    ├── agents/find-products.md
    ├── avatars/expert.png
    └── skills/fore-vip-product/            # 需求澄清问题库 / 评分标尺 / 输出模板
```

## 使用方式

专家包经 WorkBuddy 开放平台发布，终端用户从 WorkBuddy 专家市场安装：

1. 打开 WorkBuddy，左侧栏选择「专家」
2. 搜索专家名（`geo` / `site` / `find-customers` / `find-products`）
3. 安装后直接在新会话中对话即可

## 发布链路（单向，勿逆）

```
experts/<name>/  ──上传──▶  开放平台（workbuddy.cn）  ──发布──▶  WorkBuddy 市场  ──安装──▶  本机专家中心 · 回测
```

| 环节 | 位置 | 说明 |
|---|---|---|
| 发布源 | `~/git/auto/experts/<name>/` | 本目录，唯一可编辑处 |
| 上传目标 | 开放平台 workbuddy.cn | 专家包整体上传 |
| 分发 | WorkBuddy 市场 | 平台发布的版本 |
| 回测 | `~/.workbuddy/plugins/marketplaces/my-experts/plugins/<name>/` | **只从市场安装**，不从发布源直接拷贝 |

## 禁止事项（防混沌）

- ❌ **不做「已安装 → 发布源」反向回写**：市场安装的版本可能经平台改造，回写会污染发布源。
- ❌ **不用 `cp` 从发布源直接覆盖本机专家中心**：本机版本只能来自市场安装，否则回测的是本地文件而不是市场包。
- ❌ **不改 `plugin.json` 的 `name` / `agentName` / 安装目录名 / `agents/*.md` 文件名**：它们是唯一标识，改了会让发布包的安装与回测错位。
- ✅ 唯一正确的迭代闭环：改本目录 → 上传开放平台 → 从市场安装 → 回测。

## 技能同步

技能侧迭代后同步灌入专家包，再走上面的发布链路（方向固定为**技能发布源 → 专家发布源**）：

```bash
# geo
cd ~/git/auto/skills/auto-geo && tar cf - . | (cd ~/git/auto/experts/geo/skills/auto-geo && tar xf -)

# site
cd ~/git/fore.vip/skills/fore-vip-oss  && tar cf - . | (cd ~/git/auto/experts/site/skills/fore-vip-oss && tar xf -)
cd ~/git/auto/skills/auto-site-builder && tar cf - . | (cd ~/git/auto/experts/site/skills/auto-site-builder && tar xf -)

# find-customers
cd ~/git/auto/skills/auto-find-customers && tar cf - . | (cd ~/git/auto/experts/find-customers/skills/auto-find-customers && tar xf -)

# find-products
cd ~/git/fore.vip/skills/fore-vip-product && tar cf - . | (cd ~/git/auto/experts/find-products/skills/fore-vip-product && tar xf -)
```

> 跨 `~/.workbuddy` ↔ `~/git` 的复制一律用 `tar` 管道，`cp -R` 会报 `ENOTSUP: operation not supported on socket`。

## 发布前自检

```bash
S=/Applications/WorkBuddy.app/Contents/Resources/app.asar.unpacked/resources/plugins/workbuddy-builtin/skills/expert-manager/scripts
E=~/git/auto/experts
for n in geo site find-customers find-products; do python3 $S/validate_expert.py $E/$n; done
# 每个专家仅允许「不在专家目录下」这 1 个预期 error
python3 $S/package_expert.py $E/site   # 产出上传件
```

## 版本管理

```bash
cd ~/git/auto/experts
git add -A && git commit -m "find-customers: 升级内置技能至 vX.Y.Z"
git push
```

---

MIT License · © 2026 [fore.vip](https://fore.vip)
