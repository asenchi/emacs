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
(add-auto-mode 'puppet-mode "\\.pp$")
(add-auto-mode 'erlang-mode "\\.erl?$")
(add-auto-mode 'erlang-mode "\\.hrl?$")
(add-auto-mode 'sh-mode "\\.zsh$")
(add-auto-mode 'expresso-mode "\\.js?on$$")
(add-auto-mode 'coffee-mode "\\.coffee$")
(add-auto-mode 'coffee-mode "Cakefile")

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
(add-hook 'python-mode-hook 'asenchi/show-keywords)

(defun asenchi/html-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (setq fill-column nil))

(add-hook 'html-mode-hook 'asenchi/html-mode-hook)

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
(setq org-default-notes-file (concat *org-path* "/remember.org"))

(require 'remember)
(org-remember-insinuate)
(setq org-remember-store-without-prompt t
      org-remember-default-headline "Tasks"
      org-log-done t
      org-use-fast-todo-selection t
      org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-agenda-files
      '("~/emacs/org/remember.org"
        "~/emacs/org/bookmarks.org"
        "~/emacs/org/family.org"
        "~/emacs/org/groceries.org"
        "~/emacs/org/house.org"
        "~/emacs/org/learning.org"
        "~/emacs/org/notes.org"
        "~/emacs/org/projectcloud.org"
        "~/emacs/org/projects.org"
        "~/emacs/org/quotes.org"
        "~/emacs/org/todo.org"))

(setq org-refile-use-outline-path t)
(setq org-use-tag-inheritance t
      org-use-property-inheritance t)
(setq org-remember-clock-out-on-exit nil)
(setq org-completion-use-ido t)
(setq org-refile-targets
      (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))
(setq org-refile-use-outline-path (quote file))
(setq org-outline-path-complete-in-steps t)
(setq org-refile-allow-creating-parent-nodes (quote confirm))
(setq org-archive-mark-done nil)

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cr" 'org-remember)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)")
        (sequence "WAITING(w)" "|" "CANCELLED(C!/!)")
        (sequence
         "IDEA(c)" "STARTED(S!)" "TEST(T)" "DEPLOY(D)" "|" "DONE(d!/!)")
        ))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "DarkOrange1" :weight bold))
        ("STARTED" . (:foreground "blue" :weight bold))
        ("TEST" . (:foreground "red"))
        ("DEPLOY" . (:foreground "light blue"))
        ("DONE" . (:foreground "light sea green"))
        ))

(setq org-todo-state-tags-triggers
      (quote (("WAITING" ("WAITING" . t) ("NEXT"))
              (done ("WAITING") ("NEXT") ("TEST") ("DEPLOY"))
              ("TODO" ("WAITING") ("NEXT") ("TEST") ("DEPLOY"))
              ("DONE" ("WAITING") ("NEXT") ("TEST") ("DEPLOY"))
              ("STARTED" ("WAITING"))
              ("TEST" ("TEST" . t))
              ("DEPLOY" ("DEPLOY" . t) ("TEST"))
              )))

(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@work" . ?o)
                            ("@home" . ?h)
                            ("@coffeeshop" . ?c)
                            (:endgroup)
                            ("NEXT" . ?n)
                            ("WAITING" . ?w)
                            ("HOME" . ?H)
                            ("LEARN" . ?l)
                            ("PROJECT" . ?p)
                            ("PROJECTCLOUD" . ?P)
                            ("WORK" . ?O)
                            ("TEST" . ?t)
                            ("DEPLOY" . ?d))))


(defun asenchi/clock-in-to-started (kw)
  "Switch task from TODO to STARTED when clocking in"
  (if (and (string-equal kw "TODO")
           (not (string-equal (buffer-name) "*Remember*")))
      "STARTED"
    nil))
(setq org-clock-in-switch-to-state 'asenchi/clock-in-to-started)

(setq org-remember-templates
      '(("todo" ?t "* TODO %^{TODO}\n %?\n %a" nil bottom nil)
        ("note" ?n "** %^{Note} :NOTE:\n %U\n %a" nil bottom nil)
        ("learn" ?l
         "*** %^{Lesson} %^g\n %U\n %?\n" "~/org/learning.org" bottom nil)
        ("Quote" ?q
         "** %^{Quote} - %^{Author} %u %^G\n"
         "~/emacs/org/quotes.org" "Quotes")
        ("Bookmark" ?b
         "* ([%^{URL}] %^{Description} %U)\n"
         "~/emacs/org/bookmarks.org" "Bookmarks")))

(setq org-agenda-custom-commands
      (quote (("s" "Started Tasks" todo "STARTED"
               ((org-agenda-todo-ignore-scheduled nil)
                (org-agenda-todo-ignore-deadlines nil)
                (org-agenda-todo-ignore-with-date nil)))
              ("r" "Refile New Notes and Tasks" tags "LEVEL=1+REMEMBER"
               ((org-agenda-todo-ignore-with-date nil)
                (org-agenda-todo-ignore-deadlines nil)
                (org-agenda-todo-ignore-scheduled nil)))
              ("N" "Notes" tags "NOTE" nil)
              ("A" "Tasks to be Archived" tags "LEVEL=2/DONE|CANCELLED" nil)
              ("p" "project(cloud)"
               ((agenda)
               (tags-todo "+PRIORITY=\"A\""
                           ((org-agenda-files
                             '("~/emacs/org/projectcloud.org"))))
               (todo "STARTED"
                     ((org-agenda-files '("~/emacs/org/projectcloud.org"))))
               (tags "TEST|DEPLOY|WAITING"
                     ((org-agenda-files '("~/emacs/org/projectcloud.org"))))
               (tags "PROJECTCLOUD" nil)))
              ("P" "Projects" tags "PROJECT" nil)
              ("b" "Bookmarks" tags "BOOKMARK" nil)
              ("q" "Quotes" tags "QUOTES" nil)
              ("c" "Test and Deploy"
               ((tags "TEST")
                (tags "DEPLOY")))
              )))

;; Resume clocking tasks when emacs is restarted
(org-clock-persistence-insinuate)
;
;; Yes it's long... but more is better ;)
(setq org-clock-history-length 28)

;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)

;; Change task state to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")

;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK" "CLOCK")))

;; Save clock data in the CLOCK drawer and state changes
;; and notes in the LOGBOOK drawer
(setq org-clock-into-drawer "CLOCK")

;; Sometimes I change tasks I'm clocking quickly
;; - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Don't clock out when moving task to a done state
(setq org-clock-out-when-done nil)

;; Save the running clock and all clock history when exiting Emacs,
;; load it on startup
(setq org-clock-persist (quote history))

;; Disable auto clock resolution
(setq org-clock-auto-clock-resolution nil)

(defun asenchi/clock-in-task-by-id (id)
  "Clock in a task by id"
  (require 'org-id)
  (save-restriction
    (widen)
    (org-with-point-at (org-id-find id 'marker)
      (org-clock-in nil))))

(defun asenchi/clock-in-organization-task ()
  (interactive)
  (asenchi/clock-in-task-by-id "8822EC04-14A8-49C7-B8EA-C0228EE30BD9"))

(defun asenchi/clock-in-read-news-and-email-task ()
  (interactive)
  (asenchi/clock-in-task-by-id "6BA66086-3663-4315-969D-44DC15739093"))

(defun asenchi/clock-in-interrupted-task ()
  "Clock in the interrupted task if there is one"
  (interactive)
  (if (and (not org-clock-resolving-clocks-due-to-idleness)
           (marker-buffer org-clock-marker)
           (marker-buffer org-clock-interrupted-task))
      (org-with-point-at org-clock-interrupted-task
        (org-clock-in nil))
    (org-clock-out)))

(setq org-stuck-projects
      (quote
       ("LEVEL=2-REFILE-WAITING|LEVEL=1+REFILE/!-DONE-CANCELLED-OPEN"
        nil ("NEXT") "")))

(defvar org-journal-file "~/emacs/org/journal.org"
  "Path to OrgMode journal file.")
(defvar org-journal-date-format "%Y-%m-%d"
  "Date format string for journal headings.")

(defun org-journal-entry ()
  "Create a new diary entry for today or append to an existing one."
  (interactive)
  (switch-to-buffer (find-file org-journal-file))
  (widen)
  (let ((today (format-time-string org-journal-date-format)))
    (beginning-of-buffer)
    (unless (org-goto-local-search-headings today nil t)
      ((lambda () 
         (org-insert-heading)
         (insert today)
         (insert "\n\n  \n"))))
    (beginning-of-buffer)
    (org-show-entry)
    (org-narrow-to-subtree)
    (end-of-buffer)
    (backward-char 2)
    (unless (= (current-column) 2)
      (insert "\n\n  "))))

(provide 'modes)
