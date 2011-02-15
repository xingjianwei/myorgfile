; emacs server mode  "e:\emacs-23.2\bin\emacsclientw.exe" -n -a "e:\emacs-23.2\bin\runemacs.exe" "%1"
(server-mode 1)

;set my env
(setenv "HOME" "E:/myemacs")
(setenv "PATH" "E:/myemacs")
;;set the default file path
(setq default-directory "~/")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40/")

;set color
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dark-blue)))
;bookmark
(setq warning-suppress-types nil) 
(require 'bm)

(require 'psvn)

;session  histroy
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;ido
(require 'ido)
(ido-mode t)

;; cygwin shell
(setenv "PATH" (concat "e:/cygwin/bin;" (getenv "PATH")))
(setenv "PATH" (concat "e:/puttycyg;" (getenv "PATH")))
(setq exec-path (cons "e:/cygwin/bin/" exec-path))
(require 'cygwin-mount)
(cygwin-mount-activate)

(add-hook 'comint-output-filter-functions
    'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
    'comint-watch-for-password-prompt nil t)
(setq explicit-shell-file-name "bash.exe")
;; For subprocesses invoked via the shell
;; (e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)

;;eva's cedet1.0pre7

(setq load-path (cons "~/.emacs.d/site-lisp/cedet-1.0/common" load-path))
(load-file "~/.emacs.d/site-lisp/cedet-1.0/common/cedet.el")
;;(require 'cedet)
;(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;                                  global-semanticdb-minor-mode
;                                  global-semantic-idle-summary-mode
;                                  global-semantic-mru-bookmark-mode))

(semantic-load-enable-excessive-code-helpers)
;;(semantic-mode 1)
(global-ede-mode 1)
(global-srecode-minor-mode 1) 
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))


;;ecb 2.40
(require 'ecb)

;;python 
(load "python-mode.el")
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pyw$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
;;自动加载，将 python-mode 和文件 python-mode.elc关联
(autoload 'python-mode "python-mode" "Python editing mode." t)
(global-font-lock-mode t)  ;语法加亮
(setq font-lock-maximum-decoration t)

;;(setq python-command "E:/Python31/python.exe")
(add-to-list 'load-path "E:/Python31/python.exe")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
