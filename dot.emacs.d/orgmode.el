;; org-mode
(add-auto-mode 'org-mode '"\\.org$")
(add-auto-mode 'org-mode '"\\.org_archive$")
(add-to-list 'load-path "~/org")

(setq org-startup-indented t)

; Load Org Remember Stuff
(setq org-default-notes-file "~/org/refile.org")

(require 'remember)
(org-remember-insinuate)
(setq org-remember-store-without-prompt t)
(setq org-remember-default-headline "Tasks")

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
        ("projectcloud Note" ?h
         "* %^{Title}\n :PROPERTIES:\n :on: %T\n :END:\n %?\n %x"
         "~/org/projectcloud.org" date-tree)
        ("projectcloud Todo" ?j
         "* TODO %^{Title}\n :PROPERTIES:\n :on: %T\n :END:\n %?\n %a"
         "~/org/projectcloud.org" date-tree)
        ("Bookmark" ?b "* [[%^{URL}][%^{Description}]]\n" nil "Bookmarks")))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-tag-alist
      '(("family" . ?f) ("projectcloud" . ?p)))

;; org-mode
(global-set-key "\C-ca" 'org-agenda)
;(global-set-key (kbd "<f7>") 'org-agenda)
;(global-set-key (kbd "<f7> c") 'calendar)
(global-set-key "\C-cr" 'org-remember)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cb" 'org-iswitchb)
;(global-set-key (kbd "<f6>") 'org-cycle-agenda-files)

(provide 'orgmode)