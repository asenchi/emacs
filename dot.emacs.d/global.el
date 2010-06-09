;; -*- mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

;; some options
(put 'dired-find-alternate-file 'disabled nil)
;; spaces, not tabs
(setq-default indent-tabs-mode nil)
;; default tab width 4
(setq-default tab-width 4)
;; bold keywords
(set-face-bold-p 'font-lock-keyword-face t)
;; italicize comments
(set-face-italic-p 'font-lock-comment-face t)
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

(setq mac-command-modifier 'meta)

;; colors
;; (load "color-theme-almost-monokai")
;; (load "color-theme-vibrant-ink")
(load "color-theme-github")
;; (load "color-theme-chocolate-rain")
;; (load "color-theme-twilight")
(color-theme-github)

;; (if (eq system-type 'darwin)
;;     (set-frame-parameter (selected-frame) 'alpha 90))

(if (eq system-type 'darwin)
    (set-default-font "Menlo-Regular-14"))
;     "-apple-inconsolata-medium-r-normal--16-0-72-72-m-0-iso10646-1"))

;; hooks
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'after-save-hook 'autocompile-init)

;; set file registers
(set-register ?i '(file . "~/.emacs.d/init.el"))
(set-register ?g '(file . "~/.emacs.d/global.el"))
(set-register ?m '(file . "~/.emacs.d/modes.el"))
(set-register ?k '(file . "~/.emacs.d/keybindings.el"))
(set-register ?P '(file . "~/emacs/org/projectcloud.org"))
(set-register ?C '(file . "~/.emacs.d/emacs-cheatsheet.org"))

;; From emacs-starter-kit
;;;;;;;; To launch nav on left side: M-x nav RET
;;;;;;;; To launch nav on right side: C-u M-x nav RET
(defadvice other-window (around other-window-nop))
(defadvice nav (around prefix-nav)
  (if current-prefix-arg
      (ad-activate-regexp "other-window-nop"))
  (unwind-protect
      ad-do-it
    (ad-deactivate-regexp "other-window-nop")))
(ad-activate-regexp "prefix-nav")

(if (window-system)
    (set-frame-width (selected-frame) 90))

(provide 'global)
