;; FUNCTIONS
(defun insert-date-long ()
  "Insert long date at point."
  (interactive)
  (insert (format-time-string "%a %b %e, %Y %l:%M %p")))

(defun insert-date-short ()
  "Insert concise date at point."
  (interactive)
  (insert (format-time-string "%Y-%m-%d:%H%M")))

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

(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen)
			   nil
			 'fullboth)))

(defun split-window-horizontally-other ()
  "Split windows horizontally and move to the new one."
  (interactive)
  (split-window-horizontally)
  (other-window 1))

(defun split-window-vertically-other ()
  "Split windows vertically and move to the new one."
  (interactive)
  (split-window-vertically)
  (other-window 1))

(defun autocompile-init nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (if (string= (buffer-file-name)
	       (expand-file-name (concat default-directory "~/emacs")))
      (byte-compile-file (buffer-file-name))))

(defun scroll-lines-up ()
  (interactive)
  (scroll-up 5))

(defun scroll-lines-down ()
  (interactive)
  (scroll-down 5))

;; (defun cbm-lisp-environment ()
;;   (interactive)
;;   (split-window-horizontally)
;;   (other-window 1)
;;   (split-window-vertically)
;;   (other-window 1)
;;  (slime))

(defun toggle-current-window-dedication ()
  (interactive)
  (let* ((window (selected-window))
         (dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not dedicated))
    (message "Window %sdedicated to %s"
             (if dedicated "no longer " "")
             (buffer-name))))

(defun other-window-backward ()
  (interactive)
  (other-window -1))
