;; Function to edit the `user-init-file'
(defun ph/edit-user-init-file ()
  """Edit the emacs init file"""
  (interactive)
  (find-file user-init-file))
(global-set-key [f6] 'ph/edit-user-init-file)

;; Function to load the `user-init-file'
(defun ph/load-user-init-file ()
  """Load the emacs init file"""
  (interactive)
  (load-file user-init-file))
(global-set-key [f7] 'ph/load-user-init-file)

;; Function to flash the mode line
(defun ph/flash-mode-line ()
  """Change visible bell to flash mode-line."""
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))
