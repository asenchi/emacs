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

;; Looks for configurations named after system hostname.
(setq system-specific-config
      (concat *emacs-path* (car (split-string system-name "\\.")) ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

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

(require 'ido)
(ido-mode t)
(require 'imenu)
(require 'org-install)
(require 'whitespace)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'python-mode)
(setq py-python-command-args '( "-colors" "Linux"))

;; Load textmate and org-babel on Macbook.
(if (eq system-type 'darwin)
    '((require 'textmate)
      (textmate-mode)
      (require 'org-jekyll)
      (require 'org-babel-init)
      (require 'org-babel-python)
      (org-babel-load-library-of-babel)
      (setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.5/emacs" load-path))
      (setq erlang-root-dir "/usr/local/lib/erlang")
      (setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
      (require 'erlang-start)
      (require 'minimap)))

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
