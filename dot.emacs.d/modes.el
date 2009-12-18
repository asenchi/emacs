;; pretty auto-mode adder
(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;; modes
(add-auto-mode 'text-mode "\\.te?xt$")
(add-auto-mode 'perl-mode "\\.pl$")
(add-auto-mode 'lisp-mode "\\.emacs$")

(add-auto-mode 'rst-mode "\\.rst$")
(add-auto-mode 'rst-mode "\\.rest$")

;; org-mode
(add-auto-mode 'org-mode '("\\.\\(org\\|org_archive\\|txt\\)$")
;(add-to-list 'load-path "~/org-mode")

(setq org-agenda-files (quote ("~/org-mode/remember.org"
                               "~/org-mode/todo.org"
                               "~/org-mode/house.org"
                               "~/org-mode/groceries.org"
                               "~/org-mode/family.org"
                               "~/org-mode/projectcloud.org"
                               "~/org-mode/NATALIEDRAPER.org"
                               "~/org-mode/ASENCHI.org")))

(setq org-default-notes-file "~/org-mode/remember.org")
;;;  Load Org Remember Stuff
(require 'remember)
(org-remember-insinuate)
;; I use C-M-r to start org-remember
(global-set-key (kbd "C-M-r") 'org-remember)
(setq org-remember-store-without-prompt t)

;; python
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-auto-mode 'python-mode "\\.py\\'")
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-variable-buffer-local 'beginning-of-defun-function)
                 'py-beginning-of-def-or-class)
            (setq outline-regexp "def\\|class ")))

;; ruby
(add-auto-mode 'ruby-mode "\\.rake$")
(add-auto-mode 'ruby-mode "Rakefile$")
(add-auto-mode 'ruby-mode "Capfile$")
(add-auto-mode 'ruby-mode "\\.rb$")
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

(provide 'modes)
