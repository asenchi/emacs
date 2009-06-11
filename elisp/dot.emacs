; -*- mode: Emacs-Lisp -*-
(require 'cl)

; Set some variables
(setq *user-prefix* (getenv "HOME")
      *user-shell* (getenv "SHELL"))

;; LOAD
(setq load-path (append (list (concat *user-prefix* "/emacs/elisp")
                              (concat *user-prefix* "/emacs/elisp/site-pkgs"))
                        load-path))
;; REQUIRE
(require 'mercurial)
(require 'paredit)

;; VARIABLES
(if (string-equal *user-prefix* "/Users/cbm")
    (defvar *install-prefix* "/opt/local")
  (defvar *install-prefix* "/usr/local"))

;; CUSTOMIZATIONS
(defun emacs-reloaded ()
  (animate-string (concat ";; Initialiazation complete. Welcome to "
			  (substring (emacs-version) 0 16)
			  ". ")
		  0 1)
  (newline-and-indent)
  (newline-and-indent))

(display-time)
(setq inhibit-splash-screen t)
(setq indent-tabs-mode nil)
(setq window-min-height 5)
(setq debug-on-error t)
(fset 'yes-or-no-p 'y-or-n-p)

;; (setq initial-frame-alist
;;       '((background-color . "gray20")
;; 	(foreground-color . "white")
;; 	(cursor-color . "red")
;; 	(user-position t)))

;; (unless (string-equal *user-prefix* "/Users/cbm")
;;     (set-face-font 'default "-*-terminus-*-r-*-*-14-*-*-*-*-*-*-*"))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'after-save-hook 'autocompile-init)

(custom-set-variables
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(default-major-mode 'text-mode)
 '(transient-mark-mode t)
 '(auto-save-mode t)
 '(delete-old-versions t)
 '(delete-auto-save-files t)
 '(line-number-mode t)
 '(column-number-mode t)
 '(global-font-lock-mode t)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(ispell-program-name "aspell")
 '(make-backup-files nil)
 '(indent-tabs-mode nil))

(custom-set-faces)

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

(defun cbm-lisp-environment ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (split-window-vertically)
  (other-window 1)
  (slime))

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

; KEYS
(global-set-key (kbd "C-x p") 'other-window-backward)
(global-set-key [f5] 'cbm-lisp-environment)
(global-set-key (kbd "C-c d") 'toggle-current-window-dedication)
(global-set-key [(meta return)] 'toggle-fullscreen)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-q") 'scroll-lines-up)
(global-set-key (kbd "C-z") 'scroll-lines-down)
(global-set-key (kbd "C-x 3") 'split-window-horizontally-other)
(global-set-key (kbd "C-x 2") 'split-window-vertically-other)

;; MODES
(setq auto-mode-alist (cons '("\\.text$" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.txt$" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.emacs" . lisp-mode) auto-mode-alist))

;;; Org-mode
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)

;;; Font lock various modes
(setq 
 ;; emacs-lisp-mode-hook '(lambda () (font-lock-mode 1))
 ;; lisp-mode-hook '(lambda () (paredit-mode 1))
 ;; lisp-mode-hook '(lambda () (show-paren-mode t))
 html-mode-hook '(lambda () (font-lock-mode 1))
 makefile-mode-hook '(lambda () (font-lock-mode 1))
 shell-mode-hook '(lambda () (font-lock-mode 1))
 compilation-mode-hook '(lambda () (font-lock-mode 1)))

;; Emacs-Lisp
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

;; Common Lisp
(setq load-path (append (list (concat *user-prefix* "/lisp/slime"))
                        load-path))

(add-hook 'lisp-mode-hook 'turn-on-auto-fill)

(put 'iterate 'lisp-indent-function 1)
(put 'mapping 'lisp-indent-function 1)
(put 'producing 'lisp-indent-function 1)

(eval-after-load "speedbar"
 '(progn
   (add-to-list 'speedbar-obj-alist '("\\.lisp$" . ".fasl"))
   (speedbar-add-supported-extension ".lisp")))

(autoload 'paredit-mode "paredit"
  "Load paredit." t)

(dolist (hook '(emacs-lisp-mode-hook
                lisp-mode-hook
                slime-repl-mode-hook))
  (add-hook hook #'(lambda () (paredit-mode +1))))

(autoload 'redshank-mode "redshank"
  "Minor mode for restructuring Lisp code (i.e., refactoring)." t)

(dolist (hook '(emacs-lisp-mode-hook
		lisp-mode-hook
		slime-repl-mode-hook))
  (add-hook hook #'(lambda () (redshank-mode +1))))

(require 'slime)

(slime-setup
 '(inferior-slime
   slime-asdf
   slime-autodoc
   slime-banner
   slime-c-p-c
   slime-editing-commands
   slime-fancy-inspector
   slime-fancy
   slime-fuzzy
   slime-highlight-edits
   slime-parse
   slime-presentation-streams
   slime-presentations
   slime-references
   slime-sbcl-exts
   slime-package-fu
   slime-fontifying-fu
   slime-mdot-fu
   slime-scratch
   slime-tramp
   slime-enclosing-context
   slime-xref-browser))

(defvar *sbcl-lib-path* (concat *install-prefix* "/lib/sbcl"))
(defvar *sbcl-bin-path* (concat *install-prefix* "/bin/sbcl"))
(defvar *cl-hyperspec*  (concat *user-prefix* "/lisp/HyperSpec/"))
(setenv "SBCL_HOME" *sbcl-lib-path*) ; SBCL needs this info.

(setq slime-lisp-implementations
      `((sbcl ("sbcl"
               "--core" ".sbcl.core-with-slime"
               "--dynamic-space-size" "1024")
              ;:init (lambda (port-file _)
              ;        (format "(swank:start-server %S)\n" port-file)
              :coding-system utf-8-unix)
        (clisp ("clisp"))
        ,@slime-lisp-implementations))

(setq slime-default-lisp 'sbcl)
(setq slime-complete-symbol*-fancy t)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

(add-hook 'slime-load-hook #'(lambda () (require 'slime-fancy)))
(add-hook 'inferior-lisp-mode-hook #'(lambda () (inferior-slime-mode t)))
(remove-hook 'lisp-mode-hook 'load-and-setup-slime)

(defun indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
    (call-interactively 'slime-indent-and-complete-symbol)))

(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map [tab] 'indent-or-complete)
     (define-key lisp-mode-map [(meta ?q)] 'slime-reindent-defun)))

(eval-after-load "slime"
  '(progn
     (define-key slime-mode-map [return] 'paredit-newline)
     (define-key slime-repl-mode-map [tab] 'indent-or-complete)
     (define-key inferior-slime-mode-map [(control ?c) (control ?p)]
       'slime-repl-previous-prompt)

     (define-key slime-mode-map [(control ?h) ?f] 'info-lookup-symbol)
     (define-key slime-repl-mode-map [(control ?h) ?f] 'info-lookup-symbol)
     (define-key inferior-slime-mode-map [(control ?h) ?f] 'info-lookup-symbol)))

(slime-setup)


;; (setq auto-mode-alist
;;       (append '(
;; 		("\\.lisp$" . lisp-mode)
;; 		("\\.lsp$" . lisp-mode)
;; 		("\\.cl$" . lisp-mode)
;; ¯		("\\.asd$" . lisp-mode)
;; 		("\\.system$" . lisp-mode)
;; 		) auto-mode-alist))
;; (setq lisp-indent-function 'common-lisp-indent-function)
;; (add-hook 'lisp-mode-hook
;; 	  (lambda ()
;; 	    (define-key lisp-mode-map [(control j)] 'newline)
;; 	    (define-key lisp-mode-map [(control m)] 'newline-and-indent)
;; 	    (define-key lisp-mode-map [(control c) (\;)] 'insert-balanced-comments)
;; 	    (define-key lisp-mode-map [(control c) (:)] 'remove-balanced-comments)))
;; (slime-setup)

;; START EMACS
(add-hook 'after-init-hook 'emacs-reloaded)

;; Code for later:
;; (require 'cl)
;; (setf inferior-lisp-program "/usr/bin/clisp -ansi -q -K full -m 32M -I -E UTF-8 -Epathname ISO-8859-1 -Eforeign ISO-8859-1")
;; ;; Or sbcl, etc

;; (defun lisp-eval-region (start end &optional and-go)
;;   "Send the current region to the inferior Lisp process.
;; Prefix argument means switch to the Lisp buffer afterwards."
;;   (interactive "r\nP")
;;   (comint-send-region (inferior-lisp-proc) start end)
;;   (comint-send-string (inferior-lisp-proc) "\n")
;;   (if and-go (switch-to-lisp t)))

;; (defun lisp-eval-last-sexp (&optional and-go)
;;   "Send the previous sexp to the inferior Lisp process.
;; Prefix argument means switch to the Lisp buffer afterwards."
;;   (interactive "P")
;;   (lisp-eval-region (save-excursion (backward-sexp) (point)) (point) and-go))

;; (defun lisp-meat ()
;;    (interactive)
;;    (local-set-key (kbd "C-x C-e") 'lisp-eval-last-sexp))

;; (add-hook 'lisp-mode-hook 'lisp-meat)
;; (add-hook 'common-lisp-mode-hook 'lisp-meat) 