# dotfiles

GNU Stow で管理する個人設定ファイル群。

## 構成

```
dotfiles/
└── claude/          # ~/.claude/ にリンクされる
    └── .claude/
        ├── CLAUDE.md.template          # 新プロジェクト用テンプレート
        ├── PULL_REQUEST_TEMPLATE/      # gh pr create --body-file 用
        │   ├── japanese.md
        │   └── english.md
        └── commands/                   # 全プロジェクトで使えるスラッシュコマンド
            ├── init-project.md         # 新プロジェクト初期化
            ├── new-branch.md           # ブランチ作成
            ├── commit.md               # Conventional Commits
            └── release.md             # タグ打ち・リリース
```

> `history.jsonl` `cache/` `projects/` などランタイムデータは git 管理しない。

## セットアップ

```bash
# 1. clone
git clone https://github.com/keigo06/dotfiles ~/dotfiles

# 2. GNU Stow をインストール（未インストールの場合）
brew install stow          # macOS
sudo apt install stow      # Ubuntu/Debian

# 3. シンボリックリンクを展開
cd ~/dotfiles
./setup.sh
```

## 新マシンでのセットアップ

```bash
git clone https://github.com/keigo06/dotfiles ~/dotfiles
cd ~/dotfiles && ./setup.sh
```

## 使い方

| コマンド | 説明 |
|---|---|
| `/init-project` | 新プロジェクトの初期設定（CLAUDE.md・.github/ 生成） |
| `/new-branch 名前` | Root Branch からブランチを切る |
| `/commit` | Conventional Commits でコミット |
| `/release v1.0.0` | Root Branch にタグを打つ |
