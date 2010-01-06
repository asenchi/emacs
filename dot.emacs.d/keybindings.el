;; keybindings
(global-set-key "\C-cl" 'linum)
(global-set-key "\C-x\C-d" 'dired)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xm" 'eshell)
(global-set-key "\C-xg" 'magit-status)
(global-set-key [(control return)] 'toggle-fullscreen)
(global-set-key "\C-cd" 'toggle-current-window-dedication)
;(global-set-key "\C-x\C-b" 'buffer-menu)

(global-set-key "\M-/" 'hippie-expand)

;; org-mode
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "<f7>") 'org-agenda)
(global-set-key (kbd "<f7> c") 'calendar)
(global-set-key (kbd "C-M-r") 'org-remember)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "<f6>") 'org-cycle-agenda-files)


(provide 'keybindings)