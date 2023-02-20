;; Turning things off
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Turning things on
(electric-pair-mode 1)
;;(fringe-mode 0)
(global-hl-line-mode 1)
(delete-selection-mode 1)

;; Setting settings variables
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq frame-resize-pixelwise t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message user-login-name)
(setq native-comp-async-report-warnings-errors nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq visible-bell t)
(setq confirm-kill-emacs 'y-or-n-p)
(setq ring-bell-function 'ph/flash-mode-line)
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))
(setq-default indent-tabs-mode nil)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-autoselect-window t)
(setq scroll-conservatively 100)
(setq org-agenda-files (list "~/Time/agenda.org"))
(setq display-line-numbers-type 'relative)
(setq column-number-mode t)
(setq-default truncate-lines t)
(setq gdb-many-windows t)

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

;; Turn on some disabled commands
(put 'upcase-region 'disabled nil)

;; Set the font
(if (eq system-type 'windows-nt)
    (add-to-list 'default-frame-alist '(font . "JetBrainsMono NF-8"))
  (add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-8")))
