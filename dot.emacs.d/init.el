;; -*- mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

;; Some default variables
(setq *home-path* (expand-file-name "~"))
(setq *emacs-path* (concat *home-path* "/.emacs.d"))
(setq *vendor-path* (concat *emacs-path* "/vendor"))
(setq *custom-file* (concat *emacs-path* "/custom.el"))

;; Load the follow paths
(setq load-path
      (append (list nil *emacs-path*
		    (concat *emacs-path* "/color-themes")
		    *vendor-path*)
		    load-path))

;; (add-to-list 'load-path *emacs-path*)
;; (add-to-list 'load-path (concat *emacs-path* "/color-themes")))
;; (add-to-list 'load-path *vendor-path*)
(progn
  (cd *vendor-path*)
  (normal-top-level-add-subdirs-to-load-path))

;; Looks for configurations named after system hostname.
(setq system-specific-config
      (concat *emacs-path* (car (split-string system-name "\\.")) ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

(load *custom-file* 'noerror)

;; vendors
(require 'cl)
(require 'paredit)
(require 'yasnippet)
(require 'rst)
(require 'egg)

(require 'textmate)
(textmate-mode)

(require 'ido)
(ido-mode t)

(require 'org-install)
(require 'org-babel-init)
(require 'org-babel-python)
(org-babel-load-library-of-babel)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'python-mode)
(setq py-python-command-args '( "-colors" "Linux"))

(require 'whitespace)

;; yasnippet requirements
(yas/initialize)
(yas/load-directory (concat *vendor-path* "/yasnippet/snippets"))
(setq yas/prompt-functions
      '(yas/x-prompt
        yas/dropdown-prompt))

;; customizations
(require 'global)
(require 'functions)
(require 'keybindings)
(require 'modes)

(provide 'init)
