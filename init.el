(menu-bar-mode -1)                   
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(fringe-mode 0)
(global-hl-line-mode 1)
(delete-selection-mode 1)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message user-login-name)
(setq make-backup-files nil)
(setq visible-bell t)
(setq-default indent-tabs-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "<escape>") 'keyboard-quit)
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-z"))
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Let C-l actually clear shell screen
(add-hook 'comint-mode-hook
          (defun rm-comint-postoutput-scroll-to-bottom ()
            (remove-hook 'comint-output-filter-functions
                         'comint-postoutput-scroll-to-bottom)))

;; Flash modeline instead of bell on screen
(defun ph/flash-mode-line ()
  """ Change visible bell to flash mode-line."""
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))
(setq ring-bell-function 'ph/flash-mode-line)

;; Set the custom file to `emacs-custom.el' so it does not clutter other files
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load-file custom-file)

(dolist (mode '(prog-mode-hook
                text-mode-hook
                conf-mode-hook
                fundamental-mode-hook))
              (add-hook mode (lambda () (display-line-numbers-mode 1))))

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package helm
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))

(use-package which-key
  :init
  (which-key-mode 1)
  :config
  (setq which-key-idle-delay 0.3))

(use-package doom-themes)
(load-theme 'doom-tokyo-night t nil)

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package magit)

(use-package lsp-mode)

(use-package lsp-ui)

(use-package company
  :after
  (lsp-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package typescript-mode)

(use-package rustic)
