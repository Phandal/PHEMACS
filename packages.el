(ph/use-package-initialize)

(use-package all-the-icons)

(use-package pdf-tools)

(use-package hl-todo
  :config
  (global-hl-todo-mode t))

(use-package helm
  :config
  (helm-mode 1)
  (define-key global-map [remap find-file] #'helm-find-files)
  (define-key global-map [remap execute-extended-command] #'helm-M-x)
  (define-key global-map [remap switch-to-buffer] #'helm-mini))

(use-package swiper)
(use-package swiper-helm
  :config
  (define-key global-map [remap isearch-forward] #'swiper-helm)
  (define-key global-map [remap isearch-backward] #'swiper-helm))

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
(use-package solaire-mode
  :init
  (solaire-global-mode 1))
;; (load-theme 'doom-old-hope t nil)
(load-theme 'doom-nord t nil)

(unless (eq system-type 'windows-nt)
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize))
  
  (use-package vterm))

(use-package magit)

(use-package tree-sitter-langs)
(use-package tree-sitter
  :hook (tree-sitter-mode . tree-sitter-hl-mode)
  :config
  (global-tree-sitter-mode t))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :custom
  (setq lsp-eslint-auto-fix-on-save t)
  :hook (c-mode . lsp-mode)
  :hook (typescript-mode . lsp-mode)
  :hook (js-mode . lsp-mode)
  )

(use-package lsp-ui
  :config
  ;; (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-show-with-mouse nil))

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
;; TypeScript
(use-package typescript-mode
  :config
  (setq typescript-indent-level 2))

;; JavaScript
(setq js-indent-level 2)

;; Rust
(use-package rustic)

;; Python
(use-package lsp-pyright)
(setq python-indent-offset 2)

;; SH
(setq sh-indentation 2)

;; Java
(use-package lsp-java)
