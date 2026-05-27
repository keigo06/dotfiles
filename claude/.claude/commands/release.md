---
description: Root Branch にタグを打ってリリースする
---

以下の手順を実行してください。

## 準備
CLAUDE.md の `Git Workflow > Root Branch` を確認する。
見つからない場合は `main` をデフォルトとして使う。

## タグ名の決定
- $ARGUMENTS がある場合 → そのままタグ名として使う（例: `v1.2.0`）
- $ARGUMENTS がない場合 → 直近のタグを確認して次のバージョンを提案する

```bash
git tag --sort=-v:refname | head -5
```

## 手順

### 1. 現在の状態を確認
```bash
git status
git branch --show-current
```
未コミットの変更があれば先にコミットするよう促して終了する。

### 2. Root Branch の最新を取得
```bash
git checkout <root-branch>
git pull origin <root-branch>
```

### 3. タグ名を確認
$ARGUMENTS が指定されていない場合、直近のタグから次のバージョンを提案してユーザーに確認を取る。

### 4. タグを作成してプッシュ
```bash
git tag <tag-name>
git push origin <tag-name>
```

### 5. 完了後に表示
- タグ名
- `gh browse --releases` で Releases ページを案内する
- 必要であれば GitHub Releases のドラフト作成を提案する
