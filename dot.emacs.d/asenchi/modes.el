;; pretty auto-mode adder
(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;; modes
(add-auto-mode 'python-mode "Fabfile\\.py$")
(add-auto-mode 'yaml-mode "\\.yml$")
(add-auto-mode 'crontab-mode "\\.?cron\\(tab\\)?\\'")
(add-auto-mode 'text-mode "\\.te?xt$")
(add-auto-mode 'perl-mode "\\.pl$")
(add-auto-mode 'lisp-mode "\\.emacs$")

(add-auto-mode 'ruby-mode "\\.rake$")
(add-auto-mode 'ruby-mode "Rakefile$")
(add-auto-mode 'ruby-mode "\\.rb$")

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))


(provide 'modes)