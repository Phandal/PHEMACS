;; Turning things off
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Turning things on
(electric-pair-mode 1)
(fringe-mode 0)
(global-hl-line-mode 1)
(delete-selection-mode 1)

;; Setting settings variables
(setq frame-resize-pixelwise t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message user-login-name)
(setq make-backup-files nil)
(setq visible-bell t)
(setq confirm-kill-emacs 'y-or-n-p)
(setq ring-bell-function 'ph/flash-mode-line)
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))
(setq-default indent-tabs-mode nil)

;; Mac Specific Settings
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Setting aliases
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set the custom file to `emacs-custom.el' so it does not clutter other files
(ph/create-custom-file)
(load-file custom-file)

;; Turn on line numbers for some modes
(ph/line-numbers-per-mode)
