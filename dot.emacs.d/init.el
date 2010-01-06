;; -*- mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

;; LOAD PATHS
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")
(add-to-list 'load-path "~/.emacs.d/vendor/org-mode")
(add-to-list 'load-path "~/.emacs.d/color-themes")

;; customizations
(require 'global)
(require 'functions)
(require 'keybindings)
(require 'modes)
(require 'mode-org)

;; vendor
(require 'cl)
(require 'paredit)
(require 'yasnippet)
(require 'rst)
(require 'egg)
(require 'ido)
(ido-mode t)

(require 'org-install)
(require 'org-babel-init)
(require 'org-babel-python)
(org-babel-load-library-of-babel)

;(require 'linum)
;(require 'magit)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq ipython-command "/usr/local/bin/ipython")
(require 'python-mode)
(require 'ipython)

(setq py-python-command-args '( "-colors" "Linux"))

;; yasnippet requirements
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")
(setq yas/prompt-functions
      '(yas/x-prompt
        yas/dropdown-prompt))

;(load "django-mode.el")

(load "color-theme-almost-monokai")
(color-theme-almost-monokai)

(if (eq system-type 'darwin)
    (set-default-font
     "-apple-inconsolata-medium-r-normal--16-0-72-72-m-0-iso10646-1"))

(if (eq window-system 'x)
    (set-default-font "Inconsolata-10"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(put 'dired-find-alternate-file 'disabled nil)
