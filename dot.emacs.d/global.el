;; -*- mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

;; some options
(put 'dired-find-alternate-file 'disabled nil)

;; spaces, not tabs
(setq-default indent-tabs-mode nil)

;; bold keywords
(set-face-bold-p 'font-lock-keyword-face t)

;; italicize comments
(set-face-italic-p 'font-lock-comment-face t)

;; default tab width 4
(setq-default tab-width 4)

;; utf-8
(prefer-coding-system 'utf-8)

;; display time in status bar
(display-time)

;; easy typing
(fset 'yes-or-no-p 'y-or-n-p)

;; show at least 5 lines
(setq window-min-height 5)

;; highlight current line
(if (eq system-type 'darwin) (hl-line-mode t))
(if window-system (hl-line-mode t))

;; require newline
(setq require-final-newline t)

;; get rid of backup files
(setq backup-inhibited t)

;; merge the kill-ring w/ clipboard
(setq x-select-enable-clipboard t)


;; colors
;; (load "color-theme-almost-monokai")
;; (color-theme-almost-monokai)
(load "color-theme-chocolate-rain")
(color-theme-chocolate-rain)

;; fonts
(if (eq system-type 'darwin)
    (set-default-font
     "-apple-inconsolata-medium-r-normal--18-0-72-72-m-0-iso10646-1"))

(if (eq window-system 'x)
    (set-default-font "Inconsolata-14"))

;; hooks
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'after-save-hook 'autocompile-init)

;; set file registers
(set-register ?i '(file . "~/.emacs.d/init.el"))
(set-register ?g '(file . "~/.emacs.d/global.el"))
(set-register ?m '(file . "~/.emacs.d/modes.el"))
(set-register ?P '(file . "~/emacs/org/projectcloud.org"))
(set-register ?C '(file . "~/tmp/emacs-cheat.txt"))

(provide 'global)
