;; --------------------
;; global key bindings
;; --------------------
(global-set-key "\C-cd" 'toggle-current-window-dedication)
(global-set-key [(control meta return)] 'toggle-fullscreen)
(global-set-key "\C-xw" 'backward-kill-word)
(global-set-key "\C-x3" 'split-window-horizontally-other)
(global-set-key "\C-x2" 'split-window-vertically-other)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xm" 'eshell)
(global-set-key "\C-xg" 'magit-status)
(global-set-key "\C-x\C-d" 'dired)

(provide 'keys)