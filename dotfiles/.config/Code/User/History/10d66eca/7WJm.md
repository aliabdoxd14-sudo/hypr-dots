# 🔷 Hyprland Configuration - Blue Theme

بيئة تجريبية احترافية لـ Hyprland مع ثيم أزرق جميل وتأثيرات blur متقدمة.

## 📋 المحتويات

### التطبيقات المُعددة

1. **Hyprland** - نافذة الماناجر
   - تخطيط Dwindle و Master
   - اختصارات لوحة المفاتيح الكاملة
   - دعم Wayland كامل
   - تأثيرات blur و animations سلسة

2. **Hyprlock** - شاشة القفل
   - عرض الساعة والتاريخ
   - تأثير blur على الخلفية
   - رسائل الترحيب
   - معلومات البطارية

3. **Waybar** - شريط المهام العلوي
   - مؤشرات workspaces
   - عنوان النافذة النشطة
   - الساعة والتقويم
   - حالة الشبكة والصوت
   - البطارية والإضاءة
   - System tray

4. **Rofi** - قائمة التطبيقات
   - launcher للتطبيقات (Super+D)
   - run menu (Super+X)
   - clipboard manager (Super+V)
   - powermenu
   - اختيار والشعارات

5. **Cava** - محلل الصوت
   - عرض مرئي للموسيقى
   - ألوان متدرجة زرقاء
   - قابل للتخصيص تماماً

6. **Dunst** - نظام الإشعارات
   - إشعارات منبثقة جميلة
   - 3 مستويات أهمية
   - تكامل كامل مع النظام

7. **Kitty** - Terminal محسّن
   - تصميم حديث
   - دعم الألوان الكاملة
   - quakelike terminal اختياري
   - إدارة tabs و windows متقدمة

## 🎨 الثيم الأزرق

### الألوان الأساسية

- **الأزرق الأساسي**: `#0088ff`
- **الأزرق الداكن**: `#0055aa`
- **الأزرق الفاتح**: `#00d9ff`
- **الخلفية**: `#050510`
- **الخلفية الثانوية**: `#1a1a2e`
- **النص**: `#e0e6ff`

### التأثيرات

- ✨ Blur effect على جميع الواجهات (size: 8-10 pixels)
- 🎯 Rounded corners (8-12px)
- 💫 Smooth animations و transitions
- 🌈 Gradient backgrounds و borders
- 📍 Drop shadows مع transparency

## ⌨️ اختصارات لوحة المفاتيح

### إطلاق التطبيقات

```
Super + ENTER       → فتح Terminal (Kitty)
Super + D           → Application launcher
Super + X           → Run menu
Super + V           → Clipboard history
Super + PRINT       → Screenshot كامل
Super + Shift + P   → Screenshot منطقة معينة
```

### إدارة النوافذ

```
Super + Q           → إغلاق النافذة
Super + F           → ملء الشاشة
Super + T           → طفو/تثبيت
Super + P           → Pseudo tile
Super + J           → Toggle split
```

### التنقل

```
Super + H/J/K/L     → التنقل بين النوافذ (Vim keys)
Super + Shift + H/J/K/L → تحريك النوافذ
Super + Ctrl + H/J/K/L  → تغيير حجم النوافذ
```

### Workspaces

```
Super + 1-5         → الذهاب للـ Workspace
Super + Shift + 1-5 → نقل النافذة للـ Workspace
Super + TAB         → الـ Workspace التالي
Super + Shift + TAB → الـ Workspace السابق
```

### التحكم بالصوت والإضاءة

```
XF86AudioRaiseVolume    → رفع الصوت
XF86AudioLowerVolume    → خفض الصوت
XF86AudioMute           → كتم الصوت
XF86MonBrightnessUp     → زيادة الإضاءة
XF86MonBrightnessDown   → تقليل الإضاءة
```

## 📂 هيكل الملفات

```
~/.config/
├── hypr/
│   ├── hyprland.conf          # الإعداد الرئيسي
│   ├── environment.conf       # متغيرات البيئة
│   ├── start.sh               # سكريبت البدء
│   ├── screenshot.sh          # سكريبت لقطات الشاشة
│   └── ...
├── hyprlock/
│   └── hyprlock.conf          # إعداد شاشة القفل
├── waybar/
│   ├── config                 # إعداد شريط المهام
│   └── style.css              # أنماط وألوان
├── rofi/
│   ├── launcher.rasi          # قائمة التطبيقات
│   ├── powermenu.rasi         # قائمة الطاقة
│   ├── powermenu.sh           # سكريبت القائمة
│   └── clipboard.sh           # مدير النسخ
├── cava/
│   └── config                 # محلل الصوت
├── dunst/
│   └── dunstrc                # نظام الإشعارات
└── kitty/
    └── kitty.conf             # إعداد الـ Terminal
```

## 🚀 البدء السريع

### 1. المتطلبات

```bash
# Arch/Manjaro
sudo pacman -S hyprland hyprlock waybar rofi dunst kitty cava \
    brightnessctl wpctl grim slurp swappy wl-clipboard cliphist

# Ubuntu/Debian
sudo apt install hyprland hyprlock waybar rofi dunst kitty cava \
    brightnessctl pulseaudio-utils grim slurp wl-clipboard wl-paste

# Fedora
sudo dnf install hyprland hyprlock waybar rofi dunst kitty cava \
    brightnessctl pulseaudio-utils grim slurp wl-clipboard wl-paste
```

### 2. جعل الملفات قابلة للتنفيذ

```bash
chmod +x ~/.config/hypr/start.sh
chmod +x ~/.config/hypr/screenshot.sh
chmod +x ~/.config/rofi/powermenu.sh
chmod +x ~/.config/rofi/clipboard.sh
```

### 3. تشغيل Hyprland

من شاشة تسجيل الدخول (TTY):

```bash
Hyprland
# أو
startx hyprland
```

## 🎯 التخصيص

### تغيير الألوان

تحديث الألوان في:
- `~/.config/hypr/hyprland.conf` - بحث عن `#0088ff` و استبدل بالوني المفضل
- `~/.config/waybar/style.css` - تحديث متغيرات الألوان
- `~/.config/rofi/launcher.rasi` - تحديث الألوان في القسم `*`

### تغيير الخطوط

جميع الملفات تستخدم `JetBrains Mono`. لتغييرها:

```bash
sed -i 's/JetBrains Mono/YOUR_FONT/g' ~/.config/*/config ~/.config/*/style.css ~/.config/*/*.rasi
```

### تعديل قوة Blur

في `hyprland.conf`:

```conf
decoration {
    blur {
        size = 8        # قم بتغيير هذا (5-15)
        passes = 3      # قم بتغيير هذا (1-5)
    }
}
```

### إضافة تطبيقات للبدء التلقائي

في `hyprland.conf`:

```conf
exec-once = firefox
exec-once = spotify
exec-once = telegram-desktop
```

## 🐛 استكشاف الأخطاء

### الـ Blur لا يعمل

- تأكد من دعم GPU الخاص بك للـ blur
- جرب تقليل `blur.passes` في الإعداد
- تحقق من تحديث Hyprland: `hyprctl version`

### Waybar لا يظهر

```bash
# تشغيل يدوي:
waybar &

# عرض السجلات:
journalctl --user -u waybar -f
```

### Rofi لا يفتح

```bash
# اختبار:
rofi -show drun -theme ~/.config/rofi/launcher.rasi

# تحقق من المسار الصحيح للموضوع
```

### Terminal بطيء

جرب تغيير الخط أو تقليل حجم الـ blur:

```conf
kitty_mod = alt
font_size = 10
background_blur = 3
```

## 📚 موارد إضافية

- [Hyprland Wiki](https://wiki.hyprland.org)
- [Wayland Documentation](https://wayland.freedesktop.org)
- [JetBrains Mono Font](https://github.com/JetBrains/JetBrainsMono)
- [Nerd Fonts](https://www.nerdfonts.com)

## 💡 نصائح

1. استخدم `hyprctl` لاختبار التأثيرات:
   ```bash
   hyprctl reload
   hyprctl dispatch togglefloating
   ```

2. راقب الأداء:
   ```bash
   hyprctl debug profiling
   ```

3. احفظ لقطات الشاشة بصيغة PNG للحصول على أفضل جودة

4. جرب مدير النوافذ (Super+J) للتبديل بين Dwindle و Master layouts

## 🎭 أفكار للتحسين

- إضافة: Spotify widget
- إضافة: Game mode profile
- إضافة: Eye comfort theme variants
- إضافة: Weather widget
- إضافة: System monitoring graphs

---

**تم الإنشاء بـ ❤️ لـ Hyprland community**

استمتع بتجربة Wayland الحديثة! 🚀
