;; Set the font
(set-frame-font "Fira Code 10" nil t)

;; Turn off the startup message
(setq inhibit-startup-echo-area-message "bailey")

;; Escape will always quit
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set and load the custom file so it doesn't clog up the init file
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load-file custom-file)

;; Custom keymaps for working with init file
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
(unless (package-installed-p 'use-package)
  (straight-use-package 'use-package))
(require 'use-package)

;; ######################################################################
;;  _____           _                       _____             __ _        
;; |  __ \         | |                     / ____|           / _(_)       
;; | |__) |_ _  ___| | ____ _  __ _  ___  | |     ___  _ __ | |_ _  __ _  
;; |  ___/ _` |/ __| |/ / _` |/ _` |/ _ \ | |    / _ \| '_ \|  _| |/ _` | 
;; | |  | (_| | (__|   < (_| | (_| |  __/ | |___| (_) | | | | | | | (_| | 
;; |_|   \__,_|\___|_|\_\__,_|\__, |\___|  \_____\___/|_| |_|_| |_|\__, | 
;;                             __/ |                                __/ | 
;;                            |___/                                |___/ 
;;
;; ######################################################################


;; First up themes. I like to use the doom themes plugin
(use-package doom-themes
  :defer t)
(load-theme 'doom-nord t)
(doom-themes-visual-bell-config)

;; Along with the themes we need better icons!
(use-package all-the-icons)

;; Uh, now what... I need better help!
(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

;; Now, to get into the good stuff...vertico for completions
(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (savehist-mode 1))

;; Marginalia for more info with vertico
(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode 1))

;; Consult for more functions with completions
(use-package consult)

;; Embarks provides actions for selections
(use-package embark)

;; Embark+Consult is even better
(use-package embark-consult
  :after (embark consult))

;; Orderless provides a better search in minibuffer
(use-package orderless
  :custom (completion-styles '(orderless)))

;; I need a terminal
(use-package vterm
  :bind
  ("C-c t" . vterm-other-window))
