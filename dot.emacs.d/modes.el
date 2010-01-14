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

;; python
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-auto-mode 'python-mode "\\.py\\'")
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun asenchi/python-mode-hook ()
  (setq tab-width 4)
  (local-set-key [return] 'newline-and-indent)
  (setq indent-tabs-mode t)
  (auto-fill-mode 1)
  (turn-on-eldoc-mode)
  (setq fill-column 79)

  (define-key python-mode-map "\"" 'electric-pair)
  (define-key python-mode-map "\'" 'electric-pair)
  (define-key python-mode-map "(" 'electric-pair)
  (define-key python-mode-map "[" 'electric-pair)
  (define-key python-mode-map "{" 'electric-pair))

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-variable-buffer-local 'beginning-of-defun-function)
                 'py-beginning-of-def-or-class)
            (setq outline-regexp "def\\|class ")))
(add-hook 'python-mode-hook 'asenchi/python-mode-hook)
(add-hook 'python-mode-hook 'asenchi/format-python)
(add-hook 'python-mode-hook 'asenchi/show-keywords)

;; ruby
(add-auto-mode 'ruby-mode "\\.rake$")
(add-auto-mode 'ruby-mode "Rakefile$")
(add-auto-mode 'ruby-mode "Capfile$")
(add-auto-mode 'ruby-mode "\\.rb$")
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; diff
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

;; org-mode
(setq *org-path* (concat *home-path* "/emacs/org"))

(add-auto-mode 'org-mode '"\\.org$")
(add-auto-mode 'org-mode '"\\.org_archive$")

(add-to-list 'load-path *org-path*)
(setq org-startup-indented t)
(setq org-default-notes-file (concat *org-path* "/refile.org"))

(require 'remember)
(org-remember-insinuate)
(setq org-remember-store-without-prompt t)
(setq org-remember-default-headline "Tasks")
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-tag-alist
      '(("family" . ?f)
        ("projectcloud" . ?p)
        ("study" . ?S)
        ("house" . ?h)
        ("financs" . ?F)
        ("code" . ?c)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d!/!)" "CANCELLED(c!/!)")
        (sequence "TASK(f)" "|" "DONE(d!/!)")
        (sequence "WRITE(w)" "TEST(s@/!)" "DEPLOY(D@/!)" "|" "DONE(d!/!)")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "DarkOrange1" :weight bold))
        ("TASK" . (:foreground "blue"))
        ("TEST" . (:foreground "red"))
        ("DEPLOY" . (:foreground "light blue"))
        ("DONE" . (:foreground "light sea green"))
        ("CANCELLED" . (:foreground "forestgreen"))))

(setq org-remember-templates
      '(("Note" ?n
         "* %^{Title}\n :PROPERTIES:\n :on: %T\n :END:\n %?\n %x"
         nil date-tree)
        ("Learn" ?l
         "* LEARNLOG %^{Title}\n :PROPERTIES:\n :on: %T\n :tags: %^g\n :END:\n %^{Description}\n"
         "~/org/learning.org" date-tree)
        ("Todo" ?t
         "* TODO %^{Title}\n :PROPERTIES:\n :on: %T\n :END:\n %?\n %a"
         nil date-tree)
        ("Bookmark" ?b "* [[%^{URL}][%^{Description}]]\n" nil "Bookmarks")))

(global-set-key "\C-ca" 'org-agenda)
;(global-set-key (kbd "<f7>") 'org-agenda)
;(global-set-key (kbd "<f7> c") 'calendar)
(global-set-key "\C-cr" 'org-remember)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cb" 'org-iswitchb)
;(global-set-key (kbd "<f6>") 'org-cycle-agenda-files)

(provide 'modes)
