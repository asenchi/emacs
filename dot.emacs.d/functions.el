;; functions
(defun insert-date-long ()
  "Insert date at cursor."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(defun insert-date-short ()
  "Insert date at cursor."
  (interactive)
  (insert (format-time-string "%Y%m%d-%H:%M" (current-time))))

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

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun asenchi/isc-license ()
  "Insert ISC License"
  (interactive)
  (insert "Copyright (c) 2010 Curt Micol <asenchi@asenchi.com>"
          "Permission to use, copy, modify, and distribute this software for any"
          "purpose with or without fee is hereby granted, provided that the above"
          "copyright notice and this permission notice appear in all copies."
          ""
          "THE SOFTWARE IS PROVIDED 'AS IS' AND THE AUTHOR DISCLAIMS ALL WARRANTIES"
          "WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF"
          "MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR"
          "ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES"
          "WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN"
          "ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF"
          "OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE."))

(defun maximize-frame ()
  (interactive)
  (set-frame-size (selected-frame)
                  (display-pixel-width)
                  (display-pixel-height))
  (set-frame-position (selected-frame) 0 0))

(defun close-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun tabify-buffer ()
  (interactive)
  (tabify (point-min) (point-max)))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

(defun asenchi/show-keywords ()
  (font-lock-add-keywords
   nil
   '(("\\<\\(TODO\\|XXX\\|BUG\\):" 1 font-lock-warning-face t))))

(defun asenchi/format-python ()
  "untabify and wrap python comments"
  (interactive)
  (untabify (point-min) (point-max))
  (goto-char (point-min))
  (while (re-search-forward comment-start nil t)
    (call-interactively 'fill-paragraph)
    (forward-line 1)))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(provide 'functions)
