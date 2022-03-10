(defun bf/open-line-below (n)
  "Open a line below without splitting current line."
  (interactive "*p")
  (end-of-line)
  (newline n))

(defun bf/open-line-above (n)
  "Open a line above without splitting current line."
  (interactive "*p")
  (beginning-of-line)
  (newline n)
  (previous-line n))
