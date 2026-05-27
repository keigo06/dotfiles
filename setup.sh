#!/bin/bash
# setup.sh — dotfiles のセットアップスクリプト

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "📁 dotfiles: $DOTFILES_DIR"

# GNU Stow の確認
if ! command -v stow &> /dev/null; then
  echo "❌ GNU Stow が見つかりません"
  echo "   macOS:  brew install stow"
  echo "   Ubuntu: sudo apt install stow"
  exit 1
fi

# claude パッケージを展開（~/.claude/ にリンク）
echo "🔗 ~/.claude/ をリンク中..."
stow --dir="$DOTFILES_DIR" --target="$HOME" claude

echo ""
echo "✅ セットアップ完了"
echo ""
echo "次のステップ:"
echo "  Claude Code を起動して /init-project を実行してください"
