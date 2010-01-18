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
  (setq indent-tabs-mode nil)
  (auto-fill-mode 1)
  (turn-on-eldoc-mode)
  ;(setq fill-column 79)

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
(add-to-list 'load-path *org-path*)

(add-auto-mode 'org-mode '"\\.org$")
(add-auto-mode 'org-mode '"\\.org_archive$")

(setq org-export-htmlize-output-type 'css)
(setq org-startup-indented t
      org-ellipsis "..."
      org-hide-leading-stars t
      org-fontify-done-headline t
      org-fontify-emphasized-text t)
(setq org-default-notes-file (concat *org-path* "/default.org"))

(require 'remember)
(org-remember-insinuate)
(setq org-remember-store-without-prompt t
      org-remember-default-headline "Tasks"
      org-log-done t
      org-use-fast-todo-selection t
      org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-agenda-files
      '("~/emacs/org/default.org"
        "~/emacs/org/bookmarks.org"
        "~/emacs/org/family.org"
        "~/emacs/org/groceries.org"
        "~/emacs/org/house.org"
        "~/emacs/org/learning.org"
        "~/emacs/org/notes.org"
        "~/emacs/org/projectcloud.org"
        "~/emacs/org/quotes.org"
        "~/emacs/org/todo.org"))

(setq org-refile-targets '((org-agenda-files (:maxlevel 5))))
(setq org-refile-use-outline-path t)
(setq org-use-tag-inheritance t
      org-use-property-inheritance t)

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cr" 'org-remember)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-tag-alist
      '(("family" . ?f)
        ("projectcloud" . ?p)
        ("study" . ?S)
        ("house" . ?h)
        ("financs" . ?F)
        ("code" . ?c)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d!/!)")
        (sequence "CODE(c)"
                  "INPROG(s@/!)"
                  "TEST(s@/!)"
                  "DEPLOY(D@/!)"
                  "|" "DONE(d!/!)")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "DarkOrange1" :weight bold))
        ("INPROG" . (:foreground "blue" :weight bold))
        ("TEST" . (:foreground "red"))
        ("DEPLOY" . (:foreground "light blue"))
        ("DONE" . (:foreground "light sea green"))
        ("CANCELLED" . (:foreground "forestgreen"))))

(setq org-remember-templates
      '(("Todo" ?t
         "* TODO %^{Title}\n :PROPERTIES:\n :on: %U\n :END:\n %?\n %a"
         nil date-tree)
        ("Note" ?n
         "* %^{Title}\n :PROPERTIES:\n :on: %U\n :tags: %^G\n :END:\n %?\n %x"
         "~/emacs/org/notes.org" "Notes")
        ("Learn" ?l
         "** %^{Item}\n :PROPERTIES:\n :on: %U\n :tags: %^G\n :END:\n %^{Description}\n"
         "~/org/learning.org" date-tree)
        ("Quote" ?q
         "** %^{Quote} - %^{Author} %u %^G\n"
         "~/emacs/org/quotes.org" "Quotes")
        ("Bookmark" ?b
         "* ([%^{URL}] %^{Description} %U)\n"
         "~/emacs/org/bookmarks.org" "Bookmarks")))


(provide 'modes)
