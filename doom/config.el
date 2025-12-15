;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

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
(setq doom-font (font-spec :family "Vazir Code" :size 18 :weight 'semi-light)
      )
;;
;;(setq doom-font (font-spec :family "Vazir Code" :size 12 :weight 'semi-light)
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


;; Theme
;;(setq doom-theme 'gruvbox-dark-hard) ;; or gruvbox-light-medium
;;(setq doom-theme 'doom-one)
;; Green GruvBox == doom-pine
;;(setq doom-theme 'doom-pine)
;;(setq doom-theme 'doom-homage-black)
(setq doom-theme 'doom-gruvbox)

(setq centaur-tabs-set-icons t
        centaur-tabs-height 36
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-set-bar 'over
        centaur-tabs-set-modified-marker t
        ;;centaur-tabs-close-button ""
        centaur-tabs-close-button ""
        centaur-tabs-new-tab-text "  "
        centaur-tabs-modified-marker ""
        centaur-tabs-icon-type 'nerd-icons
        ;; Scrolling (with the mouse wheel) past the end of the tab list
        ;; replaces the tab list with that of another Doom workspace. This
        ;; prevents that.
        centaur-tabs-cycle-scope 'tabs)






;; Cursor
(setq evil-normal-state-cursor 'box)
(setq evil-insert-state-cursor '(bar . 2))
(setq evil-visual-state-cursor 'box)
(setq evil-replace-state-cursor 'hbar)



;; Enable mouse support
(xterm-mouse-mode 1)
(mouse-wheel-mode 1)
(context-menu-mode 1)

;; Better mouse behavior with Evil
(setq mouse-yank-at-point t)


(setq fancy-splash-image "~/.config/doom/images/logo.png")




;;(add-to-list 'default-frame-alist '(alpha . (50 . 10)))

;; Enable Centaur Tabs automatically
;;(setq centaur-tabs t)
;;(setq centaur-tabs-mode t)
;;(setq centaur-tabs-style "alternate")
;;(setq centaur-tabs-icon-type 'all-the-icons)
;;(setq centaur-tabs-close-button "")
;;(setq centaur-tabs-new-tab-text "")
;;





;; Treemacs on the right side + smaller width
(setq treemacs-position 'right)
(setq treemacs-width 30) ;; adjust number as you like
(setq treemacs-nerd-icons t)



(with-eval-after-load 'treemacs
  (set-face-attribute 'treemacs-root-face nil
                      :height 130))




;;;; Whether display the icons.
;;(setq nerd-icons-ibuffer-icon t)
;;
;;;; Whether display the colorful icons.
;;;; It respects `nerd-icons-color-icons'.
;;(setq nerd-icons-ibuffer-color-icon t)
;;
;;;; The default icon size in ibuffer.
;;(setq nerd-icons-ibuffer-icon-size 1.0)
;;
;;;; Use human readable file size in ibuffer.
(setq  nerd-icons-ibuffer-human-readable-size t)
;;
;;;; A list of ways to display buffer lines with `nerd-icons'.
;;;; See `ibuffer-formats' for details.
;;nerd-icons-ibuffer-formats
;;
;;;; Slow Rendering
;;;; If you experience a slow down in performance when rendering multiple icons simultaneously,
;;;; you can try setting the following variable
;;(setq inhibit-compacting-font-caches t)
