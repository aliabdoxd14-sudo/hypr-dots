Blue Hyperland Shell (Fish) — quickshell

ثيم شل بسيط ومرتب بلون أزرق مناسب مع Hyperland. يتضمن:
- موجه (prompt) لـ `fish` بلون أزرق
- ثيم ألوان لـ `alacritty` و `kitty` (قابل للاستخدام مع أي terminal على Wayland)

طريقة الاستخدام (سريعة):

1. انسخ ملفات `fish` إلى مجلد الإعدادات الخاص بك:

```fish
mkdir -p ~/.config/fish/functions
cp -r ~/.config/quickshell/fish/functions/fish_prompt.fish ~/.config/fish/functions/
cp -r ~/.config/quickshell/fish/functions/fish_right_prompt.fish ~/.config/fish/functions/
cp -r ~/.config/quickshell/fish/config.fish ~/.config/fish/config.fish
```

2. لتطبيق ثيم `alacritty`:

```fish
mkdir -p ~/.config/alacritty
cp ~/.config/quickshell/alacritty/blue_hyperland.yml ~/.config/alacritty/colors.yml
# ثم ضمن ملف ~/.config/alacritty/alacritty.yml أدرج:  import:
#   - ~/.config/alacritty/colors.yml
```

3. لتطبيق ثيم `kitty`:

```fish
mkdir -p ~/.config/kitty
cp ~/.config/quickshell/kitty/blue_hyperland.conf ~/.config/kitty/colors.conf
# ثم ضمن ~/.config/kitty/kitty.conf أضف: include colors.conf
```

ملاحظات:
- هذا التكوين يعتمد فقط على `fish` وميزات قياسية (لا يحتاج إلى حزمة خارجية). إذا رغبت بمظهر متقدّم (مؤشرات Git أسرع، auto-suggestions، إلخ) أنصح بتثبيت `oh-my-fish` أو `fisher` و إضافات مثل `z` و `fzf`.
- يمكنك تخصيص ألوان الهكس في ملفات `alacritty` و `kitty` حسب ذوقك.

Enjoy — إذا تريد نسخة مع أيقونات و powerline، أخبرني لأضيف دعم Nerd Fonts.
