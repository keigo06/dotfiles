---
description: Root Branch から最新を取得して新しいブランチを切る
---

以下の手順を実行してください。

## 準備
CLAUDE.md の `Git Workflow > Root Branch` を確認する。
見つからない場合は `main` をデフォルトとして使う。

## 引数の解釈
$ARGUMENTS をそのままブランチ名として使う。
prefix がなければタスクの種類に応じて自動で付ける:
- 新機能 → `feature/$ARGUMENTS`
- バグ修正 → `fix/$ARGUMENTS`
- リファクタ → `refactor/$ARGUMENTS`
- ドキュメント → `docs/$ARGUMENTS`

## 手順
```bash
git checkout <root-branch>
git pull origin <root-branch>
git checkout -b <ブランチ名>
```

完了後、現在のブランチ名と Root Branch を表示する。
