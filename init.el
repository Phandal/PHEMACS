;; Profile emacs startup
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Emacs loaded in %s."
		     (format "%.2f seconds"
			     (float-time
			      (time-subtract after-init-time before-init-time))))))

;; Set font to my favorite
(set-frame-font "CaskaydiaCove Nerd Font Mono 10" nil t)

;; Load custom functions from other file
(load-file (concat user-emacs-directory "functions.el"))
(load-file (concat user-emacs-directory "keybinds.el"))

;; Make the `modeline' flash for the bell
(setq ring-bell-function 'ph/flash-mode-line)

;; Boostrapping `straight.el'. Taken from `https://github.com/raxod502/straight.el'
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Make `straight.el' use `use-package' forms
(setq straight-use-package-by-default t)

;; Make sure `use-packge' is installed and configured
(straight-use-package 'use-package)
(require 'use-package)

;; ################################################################
;;  _______  _______  _______  _        _______  _______  _______ 
;; (  ____ )(  ___  )(  ____ \| \    /\(  ____ \(  ____ \(  ____ \
;; | (    )|| (   ) || (    \/|  \  / /| (    \/| (    \/| (    \/
;; | (____)|| (___) || |      |  (_/ / | |      | (__    | (_____ 
;; |  _____)|  ___  || |      |   _ (  | | ____ |  __)   (_____  )
;; | (      | (   ) || |      |  ( \ \ | | \_  )| (            ) |
;; | )      | )   ( || (____/\|  /  \ \| (___) || (____/\/\____) |
;; |/       |/     \|(_______/|_/    \/(_______)(_______/\_______)
;; ###############################################################

;; OHHHHH we got modus themes now!
(use-package modus-themes
  :init
  ;; Add all your customizations prior to loading the themes
  
  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-vivendi) ;; OR (modus-themes-load-operandi)
  :bind ("<f5>" . modus-themes-toggle))

;; Along with the themes we need better icons!
(use-package all-the-icons)

;; I need proper env variables
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
   (exec-path-from-shell-initialize)))
  
;; Undo needs a rehaul
(use-package undo-tree
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  :diminish)

;; Uh, now what... I need better help!
(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

;; Wait, what key do I use for that?
(use-package which-key
  :config
  (which-key-mode 1)
  :custom
  (setq which-key-idle-delay 0.3)
  :diminish)

;; Git is like totally essential.
(use-package magit)

;; I must have a vterm
(use-package vterm
  :bind
  ("C-c t" . vterm-other-window))

;; Who wants a huge modeline anyway
(use-package diminish)

;; Better syntax highlighting
(use-package tree-sitter-langs)
(use-package tree-sitter
  :diminish
  :after tree-sitter-langs
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Now, to get into the good stuff...vertico for completions
(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (savehist-mode 1)
  (setq vertico-cycle t))

;; Marginalia for more info with vertico
(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode 1))

;; Consult for more functions with completions
(use-package consult
  :bind
  ("C-s" . consult-line)
  ("C-x b" . consult-buffer))

;; Embarks provides actions for selections in consult
(use-package embark
  :bind
  ("C-." . embark-act)
  ("C-," . embark-dwim))

;; Embark+Consult is even better
(use-package embark-consult
  :after (embark consult))

;; Orderless provides a better search in minibuffer
(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-overrides '((file (styles . (partial-completion))))))

;; ######################################################################
;;  _        _______  _______         _______  _______  ______   _______ 
;; ( \      (  ____ \(  ____ )       (       )(  ___  )(  __  \ (  ____ \
;; | (      | (    \/| (    )|       | () () || (   ) || (  \  )| (    \/
;; | |      | (_____ | (____)| _____ | || || || |   | || |   ) || (__    
;; | |      (_____  )|  _____)(_____)| |(_)| || |   | || |   | ||  __)   
;; | |            ) || (             | |   | || |   | || |   ) || (      
;; | (____/\/\____) || )             | )   ( || (___) || (__/  )| (____/\
;; (_______/\_______)|/              |/     \|(_______)(______/ (_______/ 
;; ######################################################################
(use-package lsp-mode
  :hook (c-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :diminish)

(use-package lsp-ui
  :diminish)

(use-package company
  :after
  (lsp-mode)
  :config
  (setq company-minimum-prefix-length 1)
  :diminish)

(use-package company-box
  :hook (company-mode . company-box-mode)
  :diminish)

(use-package flycheck
  :config
  (global-flycheck-mode)
  :diminish)

(use-package projectile
  :config
  (projectile-mode 1))

