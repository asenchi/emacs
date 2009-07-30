; -*- mode: Emacs-Lisp -*-

;; User's $HOME
(setq *user-prefix* (getenv "HOME"))

;; load-path
(add-to-list 'load-path "~/.emacs.d/site-packages")
(add-to-list 'load-path "~/.emacs.d/color-themes")
(setq asenchi "~/.emacs.d/asenchi.el")
(load-file asenchi)

;; color-theme
(load "color-theme-almost-monokai")
(color-theme-almost-monokai)

;; fonts
(if (string-equal *user-prefix* "/Users/cbm")
  (set-face-font
   'default "-apple-inconsolata-medium-r-normal--14-0-72-72-m-0-iso10646-1")
  (set-face-font
   'default "-*-terminus-*-r-*-*-14-*-*-*-*-*-*-*"))

;; startup
(defun emacs-reloaded ()
  (animate-string (concat ";; Initialiazation complete. Welcome to "
			  (substring (emacs-version) 0 16)
                          ". ")
		  0 1)
  (newline-and-indent)(newline-and-indent))

(display-time)
(setq inhibit-splash-screen t)
(setq indent-tabs-mode nil)
(setq window-min-height 5)
(setq debug-on-error t)
(fset 'yes-or-no-p 'y-or-n-p)
;(setq initial-frame-alist '(user-position t))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'after-save-hook 'autocompile-init)



;;; Font lock various modes
(setq 
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

;; START EMACS
(add-hook 'after-init-hook 'emacs-reloaded)
