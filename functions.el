(defun ph/remove-comint-postoutput-scroll-to-bottom ()
  """ Remove scroll to bottom hook in shell mode. """
  (remove-hook 'comint-output-filter-functions 'comint-postoutput-scroll-to-bottom))

(defun ph/flash-mode-line ()
  """ Change visible bell to flash the mode-line. """
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

(defun ph/create-custom-file ()
  """ If the custom file is not created then create it. """
  (unless (file-exists-p custom-file)
    (write-region "" nil custom-file)))

(defun ph/line-numbers-per-mode ()
  """ Turn on line numbers for certain modes. """
  (dolist (mode '(prog-mode-hook text-mode-hook conf-mode-hook fundamental-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 1)))))

(defun ph/use-package-initialize ()
  """ Make sure `use-package' is installed and `package.el' has contents downloaded. """
  (require 'package)
  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("elpa" . "https://elpa.gnu.org/packages/")
                           ("org" . "https://orgmode.org/elpa")))

  (package-initialize)
  
  (unless package-archive-contents
    (package-refresh-contents))
  
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  (require 'use-package)
  (setq use-package-always-ensure t))

(defun ph/eslint-fix-file ()
  (interactive)
  (message "eslint --fix the file" (buffer-file-name))
  (call-process-shell-command
   (concat "eslint --fix " (buffer-file-name))
   nil "*Shell Command Output*" t)
  (revert-buffer t t))
