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

(require 'color-theme)

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
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-mode t)
 '(column-number-mode t)
 '(default-major-mode (quote text-mode) t)
 '(delete-auto-save-files t)
 '(delete-old-versions t)
 '(egg-git-command "/usr/local/git/bin/git")
 '(global-font-lock-mode t)
 '(ibuffer-enable t)
 '(inhibit-startup-screen t)
 '(ispell-program-name "aspell")
 '(line-number-mode t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/emacs/org/bookmarks.org" "~/emacs/org/default.org" "~/emacs/org/family.org" "~/emacs/org/groceries.org" "~/emacs/org/house.org" "~/emacs/org/learning.org" "~/emacs/org/notes.org" "~/emacs/org/projectcloud.org" "~/emacs/org/quotes.org" "~/emacs/org/todo.org")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
