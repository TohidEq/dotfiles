;;; writemoon.el -*- lexical-binding: t; -*-

(require 'writeroom-mode)
(require 'visual-fill-column)
(require 'ef-themes)

;; -----------------------------
;; Fonts
;; -----------------------------
(setq doom-variable-pitch-font
      (font-spec :family "Inter" :size 14))       ;; English

;; -----------------------------
;; Enable WriteMoon
;; -----------------------------
(defun writeroom-enable ()
  "Activate distraction-free writing mode."
  ;; Fonts
  (variable-pitch-mode 1)


  ;; Visual Fill Column
  (setq visual-fill-column-width 40
        visual-fill-column-center-text t
        visual-fill-column-fringes-outside-margins t)
  (visual-fill-column-mode 1)
  (+word-wrap-mode 1)

  ;; Spacious padding for top/bottom

  (set-window-margins (selected-window) 1 1)
  ;;;; Distractions off
  (display-line-numbers-mode -1)

  (setq-local mode-line-format nil)
  ;;;; Bidi (LTR/RTL)
  (setq bidi-paragraph-direction nil)

  ;;;; Turn off all highlighting
  (rainbow-mode -1)
  (rainbow-delimiters-mode -1)
  (pulsar-mode -1)
  ;;(nyan-mode -1)
  (centaur-tabs-mode -1)
  ;; HighLight current line (Disable)
  (hl-line-mode -1)

  ;;(font-lock-mode -1)
  (show-paren-mode -1)
  (diff-hl-mode -1)
  (writegood-mode -1)
  (vi-tilde-fringe-mode -1)
  )


;; -----------------------------
;; Disable WriteMoon
;; -----------------------------
(defun writeroom-disable ()
  "Restore normal Doom behavior."
  (variable-pitch-mode -1)
  
  (visual-fill-column-mode -1)
  (+word-wrap-mode -1)

  (rainbow-mode 1)
  (rainbow-delimiters-mode 1)
  (pulsar-mode 1)
  (display-line-numbers-mode 1)
  (centaur-tabs-mode 1)
  ;; HighLight current line (Enable)
  (hl-line-mode 1)
  
  ;;(font-lock-mode 1)
  (show-paren-mode 1)
  (diff-hl-mode 1)
  (writegood-mode 1)
  (vi-tilde-fringe-mode 1)
  )

;; -----------------------------
;; Hooks
;; -----------------------------
(add-hook 'writeroom-mode-hook #'writemoon-toggle)

(defun writemoon-toggle ()
  (if writeroom-mode
      (writeroom-enable)
    (writeroom-disable)))

;; -----------------------------
;; Keybinding
;; -----------------------------
(map! :leader
      :desc "Toggle WriteMoon"
      "t W" #'writeroom-mode)

(provide 'writemoon)
;;; writemoon.el end here
