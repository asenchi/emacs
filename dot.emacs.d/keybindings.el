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

(provide 'keybindings)