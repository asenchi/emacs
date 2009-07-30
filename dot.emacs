;; -*- mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

;; --------------------
;; set variables
;; --------------------

;; --------------------
;; load-path
;; --------------------
(add-to-list 'load-path "~/.emacs.d/site-packages")
(add-to-list 'load-path "~/.emacs.d/color-themes")
(add-to-list 'load-path "~/.emacs.d/asenchi")

;; --------------------
;; requires
;; --------------------
(require 'cl)
(require 'yaml-mode)
(require 'paredit)
(require 'arduino-mode)
;(require 'crontab-mode)
(require 'gist)
(require 'git)
(require 'git-blame)

;; asenchi
(require 'functions)
(require 'keys)
(require 'modes)

(if (eq system-type 'darwin)
    (require 'python))

;; --------------------
;; color-theme
;; --------------------
; dark
(load "color-theme-almost-monokai")
(color-theme-almost-monokai)
; light
;(load "color-theme-github")
;(color-theme-github)

;; default-font
(if (eq system-type 'darwin)
    (set-default-font
     "-apple-inconsolata-medium-r-normal--14-0-72-72-m-0-iso10646-1"))

(if (eq window-system 'x)
  (set-default-font "Inconsolata-12"))

;; --------------------
;; setup
;; --------------------
(fset 'yes-or-no-p 'y-or-n-p)
(display-time)
(setq window-min-height 5
      debug-on-error t)

;; --------------------
;; font-lock-modes
;; --------------------
(setq
 html-mode-hook '(lambda () (font-lock-mode 1))
 makefile-mode-hook '(lambda () (font-lock-mode 1))
 shell-mode-hook '(lambda () (font-lock-mode 1))
 compilation-mode-hook '(lambda () (font-lock-mode 1)))

;; --------------------
;; hooks
;; --------------------
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'after-save-hook 'autocompile-init)
(add-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\C-m" 'newline-and-indent)
            (add-hook 'local-write-file-hooks
                        '(lambda()
                           (save-excursion
                             (untabify (point-min) (point-max))
                             (delete-trailing-whitespace))))
             (set (make-local-variable 'tab-width) 4)
             (set (make-local-variable 'indent-tabs-mode) 'nil)))

;; --------------------
;; diff colors
;; --------------------
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))
 
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; --------------------
;; custom settings
;; --------------------
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; --------------------
;; START EMACS
;; --------------------
;(start-server)
