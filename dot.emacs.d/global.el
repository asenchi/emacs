
(set-face-bold-p 'font-lock-keyword-face t)
(set-face-italic-p 'font-lock-comment-face t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(prefer-coding-system 'utf-8)
(display-time)
(fset 'yes-or-no-p 'y-or-n-p)
(setq window-min-height 5)
(setq debug-on-error t)
(if window-system (hl-line-mode t))

;; Not sure if this is needed.
;; (setq
;;  html-mode-hook '(lambda () (font-lock-mode 1))
;;  makefile-mode-hook '(lambda () (font-lock-mode 1))
;;  shell-mode-hook '(lambda () (font-lock-mode 1))
;;  compilation-mode-hook '(lambda () (font-lock-mode 1)))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'after-save-hook 'autocompile-init)

(provide 'global)
