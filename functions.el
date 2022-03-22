(defun ph/change-to-emacs-directory ()
  """Switch current directory to the emacs directory"""
  (interactive)
  (message "Changed directory to: %s" (cd user-emacs-directory)))

(defun ph/edit-user-init-file ()
  """Edit the emacs init file"""
  (interactive)
  (find-file user-init-file))

(defun ph/load-user-init-file ()
  """Load the user init file."""
  (interactive)
  (load-file user-init-file))

(defun ph/open-line-below (n)
  "Open a line below without splitting current line."
  (interactive "*p")
  (end-of-line)
  (newline n))

(defun ph/open-line-above (n)
  "Open a line above without splitting current line."
  (interactive "*p")
  (beginning-of-line)
  (newline n)
  (previous-line n))

(defun ph/find-agenda-file ()
  "If on work PC then load the Agenda file for work."
  (interactive)
  (if (string-equal user-login-name "CSI")
      (find-file (concat (getenv "HOME") "/Agenda/agenda.org"))))
