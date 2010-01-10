;; -*- mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

;; some options

(put 'dired-find-alternate-file 'disabled nil)

;; bold keywords
(set-face-bold-p 'font-lock-keyword-face t)

;; italicize comments
(set-face-italic-p 'font-lock-comment-face t)

;; default tab width 4
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; utf-8
(prefer-coding-system 'utf-8)

;; display time in status bar
(display-time)

;; easy typing
(fset 'yes-or-no-p 'y-or-n-p)

;; show tat least 5 lines
(setq window-min-height 5)

;; highlight current line
(if (eq system-type 'darwin) (hl-line-mode t))
(if window-system (hl-line-mode t))

;; require newline
(setq require-final-newline t)

;; get rid of backup files
(setq backup-inhibited t)

;; colors
(load "color-theme-almost-monokai")
(color-theme-almost-monokai)

;; fonts
(if (eq system-type 'darwin)
    (set-default-font
     "-apple-inconsolata-medium-r-normal--16-0-72-72-m-0-iso10646-1"))

(if (eq window-system 'x)
    (set-default-font "Inconsolata-10"))

;; hooks
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'after-save-hook 'autocompile-init)

(provide 'global)
