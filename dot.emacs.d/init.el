;; -*- mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

(push "~/Developer/bin" exec-path)

(setq *emacs-path* (concat "~/.emacs.d"))
(setq *vendor-path* (concat *emacs-path* "/vendor"))

;; -- Load Paths
(setq load-path
      (append (list "~/.emacs.d"
                    "~/.emacs.d/vendor"
                    "~/.emacs.d/color-themes")
              load-path))

(progn
  (cd *vendor-path*)
  (normal-top-level-add-subdirs-to-load-path))

;; vendors
(require 'cl)
(require 'paredit)
(require 'rst)
(require 'color-theme)
(require 'ido)
(require 'uniquify)
(require 'python-mode)
(require 'puppet-mode)
(require 'mustache-mode)
(require 'ibuffer)

(ido-mode t)

(if (eq system-type 'darwin)
    (progn
      (set-frame-font "Menlo-16")
      (set-frame-width (selected-from) 90)))
(load-theme 'tango)

(display-time)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; custom
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-mode t)
 '(column-number-mode t)
 '(global-font-lock-mode t)
 '(set-face-bold-p 'font-lock-keyword-face t)
 '(set-face-italic-p 'font-lock-comment-face t)
 '(prefer-coding-system 'utf-8)
 '(ibuffer-enable t)
 '(inhibit-startup-message t)
 '(line-number-mode t)
 '(make-backup-files nil)
 '(x-select-enable-clipboard t)
 '(mac-command-modifier 'meta)
 '(set-fringe-style -1)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(tooltip-mode -1)
 '(transient-mark-mode t)
 '(delete-selection-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

; -- macros
(defmacro add-all-to-list (lst &rest rest)
  (let ((adds
         (mapcar (lambda(x)
                   `(add-to-list lst ,x))
                 rest)))
    `progn ,@adds))

; -- functions
(defun electric-pair ()
  "Insert character pair without surrounding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

(defun elisp-indent-or-complete (&optional arg)
  (interactive "p")
  (call-interactively 'lisp-indent-line)
  (unless (or (looking-back "^\\s-*")
          (bolp)
          (not (looking-back "[-A-Za-z0-9_*+/=<>!?]+")))
    (call-interactively 'lisp-complete-symbol)))

; -- modes
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load "lisp-mode"
  '(progn
     (define-key emacs-lisp-mode-map [tab] 'elisp-indent-or-complete)))


(defun python-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (local-set-key [return] 'newline-and-indent)
  (add-hook 'python-mode-hook
            (lambda ()
              (define-key python-mode-map "\"" 'electric-pair)
              (define-key python-mode-map "\'" 'electric-pair)
              (define-key python-mode-map "(" 'electric-pair)
              (define-key python-mode-map "[" 'electric-pair)
              (define-key python-mode-map "{" 'electric-pair))))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-s") 'isearch-forward-regexp) ;; Use regex search by default
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key [(control meta return)] 'ns-toggle-fullscreen)
(global-set-key [(control tab)] 'other-window)
(global-set-key (kbd "M-/") 'hippie-expand)

(server-start)
