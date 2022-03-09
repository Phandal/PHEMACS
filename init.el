;; Profile emacs startupp
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s."
                     (format "%.2f seconds"
                              (float-time
                              (time-subtract after-init-time before-init-time))))))

;; Set font based on system type.
(if (string-equal system-type "windows-nt")
    (set-frame-font "CaskaydiaCove NF 10" nil t)
  (set-frame-font "CaskaydiaCove Nerd Font Mono 10" nil t))

;; Custom keymaps for working with init file
(defun ph/change-to-emacs-directory ()
  """Switch current directory to the emacs directory"""
  (interactive)
  (message "Changed directory to: %s" (cd user-emacs-directory)))
(global-set-key [f5] 'ph/change-to-emacs-directory)

(defun ph/edit-user-init-file ()
  """Edit the emacs init file"""
  (interactive)
  (find-file user-init-file))
(global-set-key [f6] 'ph/edit-user-init-file)

(defun ph/load-user-init-file ()
  """Load the user init file."""
  (interactive)
  (load-file user-init-file))
(global-set-key [f7] 'ph/load-user-init-file)

;; Bootstrapping straight.el. Taken from `htps://github.com/raxod502/straight.el'
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
(setq straight-use-package-by-default t)

;; Make sure use-package is installed and configured
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


;; First up themes. I like to use the doom themes plugin
(use-package doom-themes
  :defer t)
(load-theme 'doom-solarized-light t)
(doom-themes-visual-bell-config)

;; Along with the themes we need better icons!
(use-package all-the-icons)

;; And emojis please
(use-package emojify
  :config
  (global-emojify-mode 1))

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
  (setq which-key-idle-delay 0.3))

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

;; I want a folder explorer
(use-package neotree
  :config
  (setq neo-theme 'arrow)
  :bind
  ("M-n" . neotree-toggle))

;; I need to have the environment variable set correctly in Linux
(if (string-equal system-type "gnu/linux")
    (use-package exec-path-from-shell
      :config
      (exec-path-from-shell-initialize)))

;; Git is like totally essential.
(use-package magit)

;; ssh-agency is import for magit on windows
(if (string-equal system-type "windows-nt")
    (use-package ssh-agency
      :after magit
      :config
      (setenv "SSH_ASKPASS" "git-gui--askpass")))

;; Speaking of git...if we are on linux lets use vterm for a terminal
(if (string-equal system-type "gnu/linux")
    (use-package vterm
      :bind
      ("C-c t" . vterm-other-window)))

;; ##################################################################
;;  _______  _______  _______    _______  _______  ______   _______ 
;; (  ___  )(  ____ )(  ____ \  (       )(  ___  )(  __  \ (  ____ \
;; | (   ) || (    )|| (    \/  | () () || (   ) || (  \  )| (    \/
;; | |   | || (____)|| |        | || || || |   | || |   ) || (__    
;; | |   | ||     __)| | ____   | |(_)| || |   | || |   | ||  __)   
;; | |   | || (\ (   | | \_  )  | |   | || |   | || |   ) || (      
;; | (___) || ) \ \__| (___) |  | )   ( || (___) || (__/  )| (____/\
;; (_______)|/   \__/(_______)  |/     \|(_______)(______/ (_______/
;; #################################################################

;; Finally we can get into org more

;; Just a setup function for org-mode
(defun bf/org-mode-setup ()
  (org-indent-mode 1)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1))

(use-package org
  :straight (:type built-in)
  :hook
  (bf/org-mode-setup)
  :config
  (setq org-hide-emphasis-markers t))

;; #############################################
;; _______  _______  _        _______ _________ 
;; (  ____ \(  ____ \( \      (  ___  )\__   __/
;; | (    \/| (    \/| (      | (   ) |   ) (   
;; | (__    | |      | |      | |   | |   | |   
;; |  __)   | | ____ | |      | |   | |   | |   
;; | (      | | \_  )| |      | |   | |   | |   
;; | (____/\| (___) || (____/\| (___) |   | |   
;; (_______/(_______)(_______/(_______)   )_(   
;; #############################################

;; trying to learn rust so...rust-mode!
(use-package rust-mode
  :config
  (setq compile-command "cargo check"))

;; I have used LSP-mode before and it felt to bloated, so I'm trying out eglot mode
(use-package eglot
  :config
  (add-hook 'rust-mode-hook 'eglot-ensure))

;; better syntax highlighting
(use-package tree-sitter-langs)

(use-package tree-sitter
  :after tree-sitter-langs
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; better completion-at-point system
(use-package company
  :config
  (setq company-minimum-prefix-length 1)
  (add-hook 'after-init-hook 'global-company-mode))

