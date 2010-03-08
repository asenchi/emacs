;; keybindings
(global-set-key "\C-x\C-d" 'dired)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xm" 'eshell)
(global-set-key "\C-xg" 'egg-status)

(global-set-key [(control meta return)] 'ns-toggle-fullscreen)
(global-set-key "\M-/" 'hippie-expand)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key "\C-xw" 'whitespace-mode)
(global-set-key "\C-xt" 'untabify-buffer)
(global-set-key "\C-xn" 'word-count)
(global-set-key [(control tab)] 'other-window)

(global-set-key "\C-cM" 'asenchi/clock-in-read-news-and-email-task)
(global-set-key "\C-cO" 'asenchi/clock-in-organization-task)
(global-set-key [remap kill-word] 'asenchi/kill-word)
(global-set-key [remap backward-kill-word] 'asenchi/backward-kill-word)
(global-set-key "\C-\M-j" 'asenchi/duplicate-line)
(global-set-key [(control meta delete)] 'asenchi/backward-kill-line)

(global-set-key "\C-c\C-o" 'org-clock-out)
(global-set-key "\C-cN" 'org-cycle-agenda-files)
(global-set-key "\C-cP" 'org-set-property-drawer)
(global-set-key "\C-cj" 'org-journal-entry)

(global-set-key "\C-t" 'ido-goto-symbol)

(global-unset-key "\C-z")

(provide 'keybindings)
