;; Set the garbage collection to a higher number
(setq gc-cons-threshold (* 50 1000 1000))

;; Turn off compiler warnings as they get very annoying
(if (fboundp 'native-comp-available-p)
    (setq native-comp-async-report-warnings-errors nil))

;; Better Defaults
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message (user-login-name))
(setq visible-bell t)
(fringe-mode 10)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
;;(global-hl-line-mode 1)
(electric-pair-mode 1)
(visual-line-mode 1)
(delete-selection-mode 1)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-autoselect-window t)
(setq scroll-conservatively 100)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; If emacs is version 29 or above use actual pixel scrolling
(if (fboundp 'pixel-scroll-precision-mode)
    (pixel-scroll-precision-mode 1)
  (pixel-scroll-mode 1))

;; Turn on line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook
		fundamental-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))'

;; Turn off package.el so I can use straight.el
(setq package-enable-at-startup nil)

;; Set encoding...very important for Windows
(set-default-coding-systems 'utf-8)

;; Set and load the custom file so it doesn't clog up the init file
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))
(load custom-file nil t)
