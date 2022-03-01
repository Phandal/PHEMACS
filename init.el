(setq gc-cons-threshold (* 50 1000 1000))

(setq make-backup-files nil)
(setq visible-bell t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(fringe-mode 0)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode 1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(auto-fill-mode 1)

(dolist (mode '(text-mode-hook
		prog-mode-hook
		conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

(defalias 'yes-or-no-p 'y-or-n-p)

(set-frame-font "Fira Code 10" nil t)

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

(use-package vterm)

(use-package which-key
       :init
	     (which-key-mode 1)
	     :config
	     (setq which-key-idle-delay 0.1))

(use-package doom-themes
  :defer t)
(load-theme 'doom-nord t)
(doom-themes-visual-bell-config)

(use-package all-the-icons)

(use-package elpher)

(use-package ivy
  :init
  (ivy-mode 1))

(use-package counsel
  :init
  (counsel-mode 1)
  :bind
  ("C-s" . swiper)
  ("C-r" . swiper))

(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(setq user-agenda-file "C:/Users/CSI/Agenda/agenda.md")
(defun ph/edit-agenda-file ()
  """Edit the agenda file."""
  (interactive)
  (find-file user-agenda-file))

(defun ph/find-user-init-file ()
  """Edit the emacs config file."""
  (interactive)
  (find-file user-init-file))

(defun ph/load-user-init-file ()
  """Load the emacs config file."""
  (interactive)
  (load-file user-init-file))

(global-set-key [f5] 'ph/edit-agenda-file)
(global-set-key [f6] 'ph/find-user-init-file)
(global-set-key [f7] 'ph/load-user-init-file)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; LSP CONFIG
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((c-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp lsp-deferred)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package flycheck)
(use-package company
  :config
  (setq company-minimum-prefix-length 1))
(use-package company-box
  :hook
  (company-mode . company-box-mode))

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helpful company-box all-the-icons company lsp-ivy company-mode flycheck lsp-ui lsp-mode vterm which-key use-package elpher doom-themes counsel))
 '(warning-suppress-types '((comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
