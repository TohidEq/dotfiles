;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


;; Use bash internally in Emacs
(setq shell-file-name (executable-find "bash"))

;; Keep fish for vterm or explicit shells
(setq-default vterm-shell "/bin/fish")
(setq-default explicit-shell-file-name "/bin/fish")





;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Tohid Eghdami"
       user-mail-address "TohidEq@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; سلام علیکم تست متن فارسی به به
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;
;;(setq doom-font (font-spec :family "Vazir Code" :size 12      uuui:weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(load! "customs/look_and_feel")
(load! "customs/writemoon")
(load! "customs/org")
(load! "customs/theme-cycle")
(load! "customs/keybinds")
(load! "customs/email")



;; enable word-wrap (almost) everywhere
(+global-word-wrap-mode +1)







;;


;;(after! org
;;  (add-to-list 'org-export-backends 'latex))

;;(after! flyspell
;;  (setq flyspell-mark-duplications-flag nil))
;;(add-hook 'org-mode-hook
;;          (lambda ()
;;            (setq-local flyspell-mark-duplications-flag nil)))
;;
;;(after! writegood
;;  (setq writegood-duplicates-font-lock-keywords-regexp nil))
;;
;;(after! writegood
;;  (defun writegood-duplicates-font-lock-keywords ()
;;    nil))





;; Left side, character of empty lines after file ends
;; >> customize-group
;; >> vi-tilde-fringe
;; >> vi tilde fringe face
;; =>>
;;  [#b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000
;;   #b11000000]
;;







;; --- UI & Editor ---
(setq user-full-name "Your Name"
      user-mail-address "your@email.com"
      display-line-numbers-type 'relative
      inhibit-startup-screen t
      ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil
              tab-width 4)

(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; --- Search & Undo ---
(setq case-replace nil
      case-fold-search t
      search-upper-case t)

(setq undo-limit 80000000
      undo-strong-limit 120000000
      undo-outer-limit 1200000000
      evil-want-fine-undo t)

;; --- Evil Behavior ---
;;(setq evil-respect-visual-line-mode t
;;      evil-kill-on-visual-paste nil
;;      evil-want-C-u-scroll t)

;; --- LSP & Completion ---
(after! lsp-mode
  (setq lsp-enable-symbol-highlighting nil
        lsp-ui-doc-enable nil
        lsp-headerline-breadcrumb-enable nil
        lsp-lens-enable nil))

(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

;; --- Languages & Frameworks ---
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'python-mode-hook 'pyvenv-mode)
(add-hook! '(rust-mode-hook c-mode-hook c++-mode-hook) #'lsp)

(setq +format-on-save-enabled-modes
      '(typescript-mode js-mode js2-mode typescript-tsx-mode css-mode scss-mode web-mode python-mode))

;; --- Keys & Navigation ---
(map! :nv "C-h" #'evil-window-left
      :nv "C-j" #'evil-window-down
      :nv "C-k" #'evil-window-up
      :nv "C-l" #'evil-window-right
      :nv "g s" #'magit-status
      :nv "g c" #'magit-commit-create
      :nv "C-`" #'vterm-toggle
      :nv "g m" #'evil-mc-make-cursor-here)

;; --- Projects ---
(after! projectile
  (setq projectile-project-search-path '("~/myworld/WorkSpace/")
        projectile-enable-caching t))

(after! yasnippet
  (yas-global-mode 1))
