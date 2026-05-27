---
description: Conventional Commits 形式でコミットする
---

以下の手順を実行してください。

## 準備
CLAUDE.md の `Language > Commit Messages` を確認する。
見つからない場合は English をデフォルトとして使う。

## Conventional Commits ルール
prefix は言語設定に関わらず英語固定:
- `feat: xxx` — 新機能
- `fix: xxx` — バグ修正
- `refactor: xxx` — リファクタリング（機能変更なし）
- `docs: xxx` — ドキュメントのみの変更
- `test: xxx` — テストの追加・修正
- `chore: xxx` — ビルド・設定などの雑務
- `style: xxx` — フォーマット・空白など（動作変更なし）

スコープが必要な場合は `feat(auth): xxx` の形式も可。

## 手順
1. CLAUDE.md の `Language > Commit Messages` を確認する
2. `git diff --staged` で変更内容を確認する
3. 変更がなければ `git add -A` を実行する
4. 変更内容から適切な prefix と言語設定に沿ったメッセージを生成する
5. $ARGUMENTS が指定されていればメッセージとして使う（言語は設定に従う）
6. コミットを実行する

```bash
git add -A  # 未 stage の場合のみ
git commit -m "<type>: <message>"
```

## 確認事項
- 1コミット1目的になっているか
- メッセージが変更の「何を・なぜ」を表しているか
