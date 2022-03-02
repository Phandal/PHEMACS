;; Set the garbage collection to a higher number
(setq gc-cons-threshold (* 50 1000 1000))

;; Better Defaults
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq visible-bell t)
(fringe-mode 10)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(pixel-scroll-mode 1)
(electric-pair-mode 1)
(auto-fill-mode 1)
(delete-selection-mode 1)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 100)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Turn on line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook
		fundamental-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))'

;; Turn off package.el so I can use straight.el
(setq package-enable-at-startup nil)
