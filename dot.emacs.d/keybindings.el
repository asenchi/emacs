;; keybindings
(global-set-key "\C-x\C-d" 'dired)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xm" 'eshell)
(global-set-key "\C-xg" 'egg-status)
(global-set-key [(control return)] 'ns-toggle-fullscreen)
(global-set-key "\M-/" 'hippie-expand)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key "\C-xw" 'whitespace-mode)
(global-set-key "\C-xt" 'untabify-buffer)

(global-set-key "\C-cM" 'asenchi/clock-in-read-news-and-email-task)
(global-set-key "\C-cO" 'asenchi/clock-in-organization-task)
(global-set-key "\C-c\C-o" 'org-clock-out)
(global-set-key "\C-cN" 'org-cycle-agenda-files)
(global-set-key "\C-cP" 'org-set-property-drawer)

(global-set-key (kbd "C-M-J") (lambda () (interactive) (swap-with 'down)))
(global-set-key (kbd "C-M-K") (lambda () (interactive) (swap-with 'up)))
(global-set-key (kbd "C-M-H") (lambda () (interactive) (swap-with 'left)))
(global-set-key (kbd "C-M-L") (lambda () (interactive) (swap-with 'right)))

(global-set-key (kbd "M-J") (lambda () (interactive) (enlarge-window 2)))
(global-set-key (kbd "M-K") (lambda () (interactive) (enlarge-window -2)))
(global-set-key (kbd "M-H") (lambda () (interactive) (enlarge-window -2 t)))
(global-set-key (kbd "M-L") (lambda () (interactive) (enlarge-window 2 t)))

;; We don't to conflict with 'M-l'.
;; (global-set-key (kbd "M-j j") 'windmove-down)
;; (global-set-key (kbd "M-k k") 'windmove-up)
;; (global-set-key (kbd "M-h h") 'windmove-left)
;; (global-set-key (kbd "M-l l") 'windmove-right)

(provide 'keybindings)
