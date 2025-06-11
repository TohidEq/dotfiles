-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
-- تنظیم termbidi برای پشتیبانی از متن‌های دوجهته در ترمینال
vim.opt.termbidi = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- تنظیمات برای پشتیبانی بهتر از زبان فارسی
vim.opt.termbidi = true
vim.opt.encoding = "utf-8" -- مطمئن بشید که انکدینگ UTF-8 هست
vim.opt.arabicshape = false -- اگر حروف جدا جدا نمایش داده میشن، این رو false بذارید.
-- اگر قبلا به هم چسبیده بود، این رو تغییر ندید یا حذف کنید.
vim.opt.delitems = true -- فعال کردن حذف آیتم‌های اضافی در نمایش
vim.opt.bomb = true -- برای تشخیص BOM در فایل‌های UTF-8
