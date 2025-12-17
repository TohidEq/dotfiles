;;; $DOOMDIR/cusotms/look_and_feel.el -*- lexical-binding: t; -*-

;; Theme
;;(setq doom-theme 'gruvbox-dark-hard) ;; or gruvbox-light-medium
;;(setq doom-theme 'doom-one)
;; Green GruvBox == doom-pine
;;(setq doom-theme 'doom-pine)
;;(setq doom-theme 'doom-homage-black)
(setq doom-theme 'doom-gruvbox)


(setq doom-font
      (font-spec :family "Vazir Code" :size 18 :weight 'regular))


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

;; Welcome image
(setq fancy-splash-image "~/.config/doom/images/logo.png")




;; File Explorer - Side bar
;; Treemacs on the right side + smaller width
(setq treemacs-position 'right)
(setq treemacs-width 30) ;; adjust number as you like
(setq treemacs-nerd-icons t)

(with-eval-after-load 'treemacs
  (set-face-attribute 'treemacs-root-face nil
                      :height 130))






;; Dired
(use-package dired
  :config
  (use-package treemacs-icons-dired
    :if (display-graphic-p)
    :config (treemacs-icons-dired-mode)))

(setq  nerd-icons-ibuffer-human-readable-size t)





;; Colorize color codes
(use-package! rainbow-mode
  :hook
  (prog-mode . rainbow-mode)
  (text-mode . rainbow-mode)

  )
(setq rainbow-hexadecimal-colors t)
(after! rainbow-mode
  (setq rainbow-show-names nil)

  (setq rainbow-blocks
        '((rainbow-ansi-colors t) ; ANSI colors (optional, can be t)
          (rainbow-hex nil)         ; #RRGGBB, #RGB
          (rainbow-rgb nil)         ; rgb(r, g, b)
          (rainbow-rgba nil)        ; rgba(r, g, b, a)
          (rainbow-hsl nil)         ; hsl(h, s, l)
          (rainbow-hsla nil)))      ; hsla(h, s, l, a)
)







;; zoom mode
(custom-set-variables
 '(zoom-window-mode-line-color "#282828")
)








;; open init.el >> tabs >> press: gd >> select config >> enter
;;  THEN:
;;   (setq centaur-tabs-set-icons t
;;      centaur-tabs-style "bar"
;;      centaur-tabs-height 34
;;      centaur-tabs-gray-out-icons 'buffer
;;      centaur-tabs-set-bar 'under
;;      x-underline-at-descent-line t
;;      centaur-tabs-set-modified-marker t
;;      ;;centaur-tabs-close-button ""
;;      centaur-tabs-close-button ""
;;      centaur-tabs-new-tab-text "  "
;;      centaur-tabs-modified-marker ""
;;      centaur-tabs-icon-type 'nerd-icons
;;      ;; Scrolling (with the mouse wheel) past the end of the tab list
;;      ;; replaces the tab list with that of another Doom workspace. This
;;      ;; prevents that.
;;      centaur-tabs-cycle-scope 'tabs)
