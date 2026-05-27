---
description: 新プロジェクトの初期設定を行う（CLAUDE.md・.github/ 生成・Superpowers・Git）
---

以下の手順を順番に実行してください。

## Step 1: CLAUDE.md の作成

`~/.claude/CLAUDE.md.template` をプロジェクトルートに `CLAUDE.md` としてコピーする。

```bash
cp ~/.claude/CLAUDE.md.template ./CLAUDE.md
```

以下の項目をユーザーに質問して CLAUDE.md を埋める：

1. **Project Overview** — このプロジェクトは何か？
2. **Stack** — 言語・フレームワーク・主要ライブラリは？
3. **Commands** — dev / test / build コマンドは？（不明なら package.json や Makefile を確認）
4. **Conventions** — 命名規則やファイル構成のルールはあるか？
5. **Key Files** — 触ってはいけないファイルや重要なエントリポイントは？
6. **Root Branch** — `main` と `develop` どちらをルートにするか？
7. **PR Review** — レビュー設定は？
   - `none` — レビューなしで自動マージ
   - `@username` — 特定のレビュアーを指定
   - `copilot` — Copilot によるコードレビュー
8. **Language** — デフォルトから変更する場合のみ
   - Code Comments: Japanese（デフォルト）
   - Commit Messages: English（デフォルト）
   - PR Description: Japanese（デフォルト）
9. **Superpowers Overrides** — TDD や git worktrees を skip したいか？

回答を受けて CLAUDE.md を更新する。

## Step 2: .github/ の生成

プロジェクトルートに `.github/` を生成する。

```bash
mkdir -p .github/PULL_REQUEST_TEMPLATE
mkdir -p .github/workflows
mkdir -p .github/ISSUE_TEMPLATE
```

### .github/PULL_REQUEST_TEMPLATE/

CLAUDE.md の `Language > PR Description` を読んで該当のテンプレートをコピーする：

```bash
# Japanese の場合
cp ~/.claude/PULL_REQUEST_TEMPLATE/japanese.md .github/PULL_REQUEST_TEMPLATE/

# English の場合
cp ~/.claude/PULL_REQUEST_TEMPLATE/english.md .github/PULL_REQUEST_TEMPLATE/
```

### .github/ISSUE_TEMPLATE/

`bug_report.md` と `feature_request.md` を CLAUDE.md の言語設定に合わせて生成する。

**Japanese の場合:**

`.github/ISSUE_TEMPLATE/bug_report.md`:
```markdown
---
name: バグ報告
about: バグの報告
---

## バグの内容


## 再現手順
1.
2.
3.

## 期待する動作


## 実際の動作


## 環境

```

`.github/ISSUE_TEMPLATE/feature_request.md`:
```markdown
---
name: 機能要望
about: 新しい機能の提案
---

## 概要


## 解決したい課題


## 提案する解決策


## 備考

```

**English の場合は英語で同内容を生成する。**

### .github/workflows/

空の `ci.yml` プレースホルダーを生成する：

```yaml
# .github/workflows/ci.yml
# TODO: CI ワークフローを設定してください
name: CI

on:
  push:
    branches: [develop, main]
  pull_request:
    branches: [develop, main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: echo "TODO: テストコマンドを設定"
```

## Step 3: Superpowers のインストール

```bash
/plugin install superpowers@claude-plugins-official
```

## Step 4: Git の初期設定

現在の git 状態を確認する:
```bash
git status
git branch
```

### Root Branch が `develop` の場合

**既存リポジトリ:**
```bash
git checkout -b develop 2>/dev/null || git checkout develop
git push -u origin develop
```
GitHub Settings → Branches → Default branch を `develop` に変更するよう案内する。

**新規リポジトリ:**
```bash
git init
git add CLAUDE.md .github/
git commit -m "chore: initial project setup"
git branch -M main
git checkout -b develop
```
リモート URL をユーザーに確認してから:
```bash
git remote add origin <URL>
git push -u origin main
git push -u origin develop
```

### Root Branch が `main` の場合

**新規リポジトリ:**
```bash
git init
git add CLAUDE.md .github/
git commit -m "chore: initial project setup"
git branch -M main
```
リモート URL をユーザーに確認してから:
```bash
git remote add origin <URL>
git push -u origin main
```

## 完了後のサマリー

以下を表示する：
```
✅ CLAUDE.md 作成済み
   - Root Branch: <値>
   - PR Review:   <値>
   - Language:    Comments=<値> / Commits=<値> / PR=<値>

✅ .github/ 生成済み
   - PULL_REQUEST_TEMPLATE/
   - ISSUE_TEMPLATE/ (bug_report, feature_request)
   - workflows/ci.yml (要設定)

✅ Superpowers インストール済み
✅ Git 初期設定済み

/new-branch <ブランチ名> で最初のブランチを切って始めましょう
```
