;; Better Defaults
(setq gc-cons-threshold (* 50 1000 1000))                   ;; Set the garbage collection to a higher number
(setq make-backup-files nil)                                ;; Turn off annoying and pesky backup files
(setq inhibit-startup-screen t)                             ;; Turn off the startup screen
(setq initial-scratch-message nil)                          ;; Blank message in scratch buffer
(setq inhibit-statup-echo-area-message (user-login-name))   ;; Turn off the startup message
(tool-bar-mode -1)                                          ;; Turn off the toolbar
(tooltip-mode -1)                                           ;; Turn off tooltips
(scroll-bar-mode -1)                                        ;; Turn off the scroll bar
(electric-pair-mode 1)                                      ;; Automatically insert the closing bracket
(visual-line-mode 1)                                        ;; Turns on word wrap and makes operations work on visual lines
(delete-selection-mode 1)                                   ;; If Selection is made, typed text replaces is
(setq mouse-wheel-scroll-aount '(3 ((shift) . 1)))          ;; Change to scrolling 3 lines at a time
(setq mouse-wheel-progressive-speed nil)                    ;; Turn off progressive scrolling
(setq scroll-conservatively 100)                            ;; Allow emacs to scroll up to 100 lines to get point back on screen otherwise recenter it
(defalias 'yes-or-no-p 'y-or-n-p)                           ;; Change yes or no to y or n
(setq-default tab-width 2)                                  ;; Set the default tab width
(setq-default indent-tabs-mode nil)                         ;; Use spaces for tabs
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Mac Specific Defaults
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Unset these keys so they don't interrupt me
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; Turn on line numbres please
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook
                fundamental-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Set and load the custom file so it does not clutter other files
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))
(load custom-file nil t)

;; Turn off package.el so I can use straight.el
(setq package-enable-at-startup nil)
