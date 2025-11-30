# illogical-impulse-inspired theme (dark blue)

ثيم أزرق غامق مستوحى من "illogical-impulse" مهيأ للاستخدام مع `quickshell` و`fish`.

Preview (ألوان رئيسية):
- Background: `#071428` (rgb 7,20,40)
- Foreground: `#D7E7FF` (rgb 215,231,255)
- Primary: `#0B3B6F` (rgb 11,59,111)
- Accent: `#33C2FF` (rgb 51,194,255)
- Path: `#FFC66D` (rgb 255,198,109)

الملفات المضافة:
- `themes/illogical-impulse-inspired.json` — تعريف الثيم.
- `apply-theme.fish` — سكربت ينسخ الثيم إلى `~/.config/quickshell/theme.json`.

كيفية التفعيل (fish):

1) من داخل المجلد `~/.config/quickshell` شغّل:

```fish
./apply-theme.fish
```

2) أضف المثال التالي إلى `~/.config/fish/config.fish` لعرض موجه بسيط بألوان الثيم:

```fish
function fish_prompt
    # user@host (white on deep blue)
    printf '\033[38;2;215;231;255m\033[48;2;11;59;111m %s@%s \033[0m' (whoami) (hostname -s)

    # path (warm yellow)
    printf ' \033[38;2;255;198;109m%s\033[0m ' (prompt_pwd)

    # simple git marker (green)
    if test -d .git
        printf '\033[38;2;109;230;168m ⭠git\033[0m'
    end

    # prompt symbol (cyan)
    printf '\n\033[38;2;51;194;255m❯ \033[0m'
end
```

3) احفظ الملف وأعد فتح الـterminal أو نفّذ `source ~/.config/fish/config.fish`.

ملاحظات وتهيئة متقدمة:
- إذا كان `quickshell` يقرأ `~/.config/quickshell/theme.json` تلقائياً فستعمل التغييرات مباشرة بعد نسخ الملف.
- بإمكانك تعديل الألوان داخل `themes/illogical-impulse-inspired.json` لتخصيص الظلال أو مستوى التباين.

هل تريد أن أعدّل درجات الأزرق أو أضيف شريط حالة (status bar) أو دعم لنظام ألوان 16/256؟
