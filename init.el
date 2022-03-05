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
(load-theme 'doom-solarized-light t)
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
  (savehist-mode 1))

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
  :custom (completion-styles '(orderless)))

;; I want a folder explorer
(use-package neotree
  :config
  (setq neo-theme 'arrow)
  :bind
  ("M-n" . neotree-toggle))

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
