
;; org-mode
(add-auto-mode 'org-mode '"\\.org$")
(add-auto-mode 'org-mode '"\\.org_archive$")
(add-to-list 'load-path "~/org-mode")

(setq org-default-notes-file "~/org-mode/refile.org")
; Load Org Remember Stuff
(require 'remember)
(org-remember-insinuate)
(setq org-remember-store-without-prompt t)
(setq org-remember-default-headline "Tasks")


(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROG(s!)" "|" "DONE(d!/!)")
        (sequence "CODE(c@/!)" "TEST(t@)" "DEPLOY(D@)" "|" "INPROD(I@/!)")))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-todo-state-tags-triggers
      '(("TEST" ("TEST" . t))
        ("DEPLOY" ("DEPLOY" . t) ("TEST"))
        ("INPROD" ("INPROD" . t) ("DEPLOY") ("TEST"))))

(provide 'mode-org)