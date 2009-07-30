
;; Common Lisp
;; (setq load-path (append (list (concat *user-prefix* "/lisp/slime"))
;;                         load-path))

;; (add-hook 'lisp-mode-hook 'turn-on-auto-fill)

;; (put 'iterate 'lisp-indent-function 1)
;; (put 'mapping 'lisp-indent-function 1)
;; (put 'producing 'lisp-indent-function 1)

;; (eval-after-load "speedbar"
;;  '(progn
;;    (add-to-list 'speedbar-obj-alist '("\\.lisp$" . ".fasl"))
;;    (speedbar-add-supported-extension ".lisp")))

;; (autoload 'paredit-mode "paredit"
;;   "Load paredit." t)

;; (dolist (hook '(emacs-lisp-mode-hook
;;                 lisp-mode-hook
;;                 slime-repl-mode-hook))
;;   (add-hook hook #'(lambda () (paredit-mode +1))))

;; (autoload 'redshank-mode "redshank"
;;   "Minor mode for restructuring Lisp code (i.e., refactoring)." t)

;; (dolist (hook '(emacs-lisp-mode-hook
;; 		lisp-mode-hook
;; 		slime-repl-mode-hook))
;;   (add-hook hook #'(lambda () (redshank-mode +1))))

;; (require 'slime)

;; (slime-setup
;;  '(inferior-slime
;;    slime-asdf
;;    slime-autodoc
;;    slime-banner
;;    slime-c-p-c
;;    slime-editing-commands
;;    slime-fancy-inspector
;;    slime-fancy
;;    slime-fuzzy
;;    slime-highlight-edits
;;    slime-parse
;;    slime-presentation-streams
;;    slime-presentations
;;    slime-references
;;    slime-sbcl-exts
;;    slime-package-fu
;;    slime-fontifying-fu
;;    slime-mdot-fu
;;    slime-scratch
;;    slime-tramp
;;    slime-enclosing-context
;;    slime-xref-browser))

;; (defvar *sbcl-lib-path* (concat *install-prefix* "/lib/sbcl"))
;; (defvar *sbcl-bin-path* (concat *install-prefix* "/bin/sbcl"))
;; (defvar *cl-hyperspec*  (concat *user-prefix* "/lisp/HyperSpec/"))
;; (setenv "SBCL_HOME" *sbcl-lib-path*) ; SBCL needs this info.

;; (setq slime-lisp-implementations
;;       `((sbcl ("sbcl"
;;                "--core" ".sbcl.core-with-slime"
;;                "--dynamic-space-size" "1024")
;;               ;:init (lambda (port-file _)
;;               ;        (format "(swank:start-server %S)\n" port-file)
;;               :coding-system utf-8-unix)
;;         (clisp ("clisp"))
;;         ,@slime-lisp-implementations))

;; (setq slime-default-lisp 'sbcl)
;; (setq slime-complete-symbol*-fancy t)
;; (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;; (add-hook 'slime-load-hook #'(lambda () (require 'slime-fancy)))
;; (add-hook 'inferior-lisp-mode-hook #'(lambda () (inferior-slime-mode t)))
;; (remove-hook 'lisp-mode-hook 'load-and-setup-slime)

;; (defun indent-or-complete (&optional arg)
;;   (interactive "p")
;;   (if (or (looking-back "^\\s-*") (bolp))
;;       (call-interactively 'lisp-indent-line)
;;     (call-interactively 'slime-indent-and-complete-symbol)))

;; (eval-after-load "lisp-mode"
;;   '(progn
;;      (define-key lisp-mode-map [tab] 'indent-or-complete)
;;      (define-key lisp-mode-map [(meta ?q)] 'slime-reindent-defun)))

;; (eval-after-load "slime"
;;   '(progn
;;      (define-key slime-mode-map [return] 'paredit-newline)
;;      (define-key slime-repl-mode-map [tab] 'indent-or-complete)
;;      (define-key inferior-slime-mode-map [(control ?c) (control ?p)]
;;        'slime-repl-previous-prompt)

;;      (define-key slime-mode-map [(control ?h) ?f] 'info-lookup-symbol)
;;      (define-key slime-repl-mode-map [(control ?h) ?f] 'info-lookup-symbol)
;;      (define-key inferior-slime-mode-map [(control ?h) ?f] 'info-lookup-symbol)))

;; (slime-setup)


;; (setq auto-mode-alist
;;       (append '(
;; 		("\\.lisp$" . lisp-mode)
;; 		("\\.lsp$" . lisp-mode)
;; 		("\\.cl$" . lisp-mode)
;; ¯		("\\.asd$" . lisp-mode)
;; 		("\\.system$" . lisp-mode)
;; 		) auto-mode-alist))
;; (setq lisp-indent-function 'common-lisp-indent-function)
;; (add-hook 'lisp-mode-hook
;; 	  (lambda ()
;; 	    (define-key lisp-mode-map [(control j)] 'newline)
;; 	    (define-key lisp-mode-map [(control m)] 'newline-and-indent)
;; 	    (define-key lisp-mode-map [(control c) (\;)] 'insert-balanced-comments)
;; 	    (define-key lisp-mode-map [(control c) (:)] 'remove-balanced-comments)))
;; (slime-setup)
