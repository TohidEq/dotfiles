;; Theme cycler
(defvar my/theme-cycle
  '(
    doom-acario-dark
    doom-acario-light
    doom-challenger-deep
    ;;modus-operandi
    modus-vivendi
    ;;doom-one
    doom-homage-black
    doom-nord-light
    doom-gruvbox
    )
  "List of themes to cycle through.")

(defvar my/current-theme-index 0
  "Current index in `my/theme-cycle`.")

(defun my/cycle-themes ()
  "Cycle through predefined themes."
  (interactive)
  ;; Disable all active themes
  (mapc #'disable-theme custom-enabled-themes)

  ;; Load next theme
  (setq my/current-theme-index
        (mod (1+ my/current-theme-index)
             (length my/theme-cycle)))

  (let ((theme (nth my/current-theme-index my/theme-cycle)))
    (load-theme theme t)
    (message "Theme switched to: %s" theme)))


(map! :leader
      :desc "Cycle themes"
      "t T" #'my/cycle-themes)
