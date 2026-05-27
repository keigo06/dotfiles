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
10. **bypassPermissions** — Claude が確認なしに全操作を実行できるようにするか？
    - `yes` → `.claude/settings.json` を生成する
    - `no` — 生成しない（都度確認が入る）

回答を受けて CLAUDE.md を更新する。

## Step 2: .claude/settings.json の生成（bypassPermissions が yes の場合のみ）

```bash
mkdir -p .claude
cat > .claude/settings.json << 'EOF'
{
  "permissions": {
    "defaultMode": "bypassPermissions"
  }
}
EOF
```

## Step 3: .github/ の生成

プロジェクトルートに `.github/` を生成する。

```bash
mkdir -p .github/PULL_REQUEST_TEMPLATE
mkdir -p .github/workflows
```

### .github/PULL_REQUEST_TEMPLATE/

CLAUDE.md の `Language > PR Description` を読んで該当のテンプレートをコピーする：

```bash
# Japanese の場合
cp ~/.claude/PULL_REQUEST_TEMPLATE/japanese.md .github/PULL_REQUEST_TEMPLATE/

# English の場合
cp ~/.claude/PULL_REQUEST_TEMPLATE/english.md .github/PULL_REQUEST_TEMPLATE/
```

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

## Step 4: Superpowers のインストール

```bash
/plugin install superpowers@claude-plugins-official
```

## Step 5: Git の初期設定

現在の git 状態を確認する:
```bash
git status
git branch
```

### Root Branch が `develop` の場合

**新規リポジトリの場合:**
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

**新規リポジトリの場合:**
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

✅ .claude/settings.json 生成済み（bypassPermissions: <yes/no>）

✅ .github/ 生成済み
   - PULL_REQUEST_TEMPLATE/
   - workflows/ci.yml (要設定)

✅ Superpowers インストール済み
✅ Git 初期設定済み

/new-branch <ブランチ名> で最初のブランチを切って始めましょう
```
