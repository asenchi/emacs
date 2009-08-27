;; functions
(defun insert-date-long ()
  "Insert date at cursor."
  (interactive)
  (insert (format-time-string "%a %b %e, %Y %l:%M %p")))

(defun insert-date-short ()
  "Insert date at cursor."
  (interactive)
  (insert (format-time-string "%Y-%m-%d:%H:%M")))

(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen)
			   nil
			 'fullboth)))

(defun dos-unix ()
  "Convert dos to unix endline characters."
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))

(defun unix-dos ()
  "Convert unix to dos endline characters."
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\n" nil t) (replace-match "\r\n")))

(defun autocompile-init nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (if (string= (buffer-file-name)
	       (expand-file-name (concat default-directory "~/emacs")))
      (byte-compile-file (buffer-file-name))))

(defun elisp-indent-or-complete (&optional arg)
  (interactive "p")
  (call-interactively 'lisp-indent-line)
  (unless (or (looking-back "^\\s-*")
	      (bolp)
	      (not (looking-back "[-A-Za-z0-9_*+/=<>!?]+")))
    (call-interactively 'lisp-complete-symbol)))

(eval-after-load "lisp-mode"
  '(progn
     (define-key emacs-lisp-mode-map [tab] 'elisp-indent-or-complete)))

(provide 'functions)