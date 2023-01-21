;; Setting keybinds
(global-set-key (kbd "<escape>") 'keyboard-quit)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c C-t") 'treemacs)
(global-set-key (kbd "<f5>") 'modus-themes-toggle)

;; Unsetting keybinds
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-z"))

;; Let C-l actually clear shell screen
(add-hook 'comint-mode-hook 'ph/remove-comint-postoutput-scroll-to-bottom)
