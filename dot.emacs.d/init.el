;; -*- mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

;; Some default variables
(setq *home-path* (expand-file-name "~"))
(setq *emacs-path* (concat *home-path* "/.emacs.d"))
(setq *vendor-path* (concat *emacs-path* "/vendor"))

;; Load the follow paths
(setq load-path
      (append (list nil *emacs-path*
		    (concat *emacs-path* "/color-themes")
		    *vendor-path*)
		    load-path))

(progn
  (cd *vendor-path*)
  (normal-top-level-add-subdirs-to-load-path))

(setq custom-file (concat *emacs-path* "/custom.el"))
(load custom-file 'noerror)

;; vendors
(require 'cl)
(require 'paredit)
(require 'yasnippet)
(require 'rst)
(require 'egg)
(require 'color-theme)
(require 'puppet-mode)
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(require 'nav)
(require 'ido)
(ido-mode t)
(require 'imenu)
(require 'org-install)
(require 'whitespace)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'python-mode)
(setq py-python-command-args '( "-colors" "Linux"))
(require 'tabbar)
(require 'mustache-mode)
(require 'rvm)
(rvm-use-default)

;; Load textmate and org-babel on Macbook.
;; (if (eq system-type 'darwin)
;;     '((require 'org-babel-init)
;;       (require 'org-babel-python)
;;       (org-babel-load-library-of-babel)
;;       ))

;; customizations
(require 'global)
(require 'functions)
(require 'keybindings)
(require 'modes)

;; yasnippet requirements
(yas/initialize)
(yas/load-directory (concat *vendor-path* "/yasnippet/snippets"))
(setq yas/prompt-functions
      '(yas/x-prompt
        yas/dropdown-prompt))

(server-start)
(provide 'init)
