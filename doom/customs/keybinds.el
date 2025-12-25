;;; $DOOMDIR/cusotms/keybinds.el -*- lexical-binding: t; -*-

;; ZOOM One Window
(map! :leader
      (:desc "Zoom window"
       "z z" #'zoom-window-zoom))



;;
;;
;;


;; Toggle (relative / absolute) line numbers
(defun my/toggle-line-numbers-abs-rel ()
  "Toggle display-line-numbers between absolute and relative."
  (interactive)
  (if (eq display-line-numbers 'relative)
      (menu-bar--display-line-numbers-mode-absolute)
    (menu-bar--display-line-numbers-mode-relative)))
(map! :leader
      :desc "Toggle line numbers style"
      "t N" #'my/toggle-line-numbers-abs-rel)



;; Toggle syntax highlight
(map! :leader
      :desc "Toggle Syntax Highlights"
      "t H" #'font-lock-mode)






;;
