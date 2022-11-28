(ph/use-package-initialize)

(use-package all-the-icons)

(use-package pdf-tools)

(use-package helm
  :config
  (helm-mode 1)
  (define-key global-map [remap find-file] #'helm-find-files)
  (define-key global-map [remap execute-extended-command] #'helm-M-x)
  (define-key global-map [remap switch-to-buffer] #'helm-mini))

(use-package which-key
  :init
  (which-key-mode 1)
  :config
  (setq which-key-idle-delay 0.3))

(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-themes)
(load-theme 'doom-tomorrow-night t nil)

(use-package doom-modeline
  ;; :init
  ;; (doom-modeline-mode t)
  :config
  (setq-default doom-modeline-height 10))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package magit)

(use-package vterm)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :custom
  (setq lsp-eslint-auto-fix-on-save t))

(use-package lsp-ui)

(use-package company
  :hook
  (lsp-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package helm-lsp)

(use-package treemacs)

(use-package lsp-treemacs)


;; LSP Language modes
(use-package typescript-mode
  :config
  (setq typescript-indent-level 2))

;; Javascript mode
(setq js-indent-level 2)

(use-package rustic)
