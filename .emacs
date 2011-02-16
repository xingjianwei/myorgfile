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

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)
(setq warning-suppress-types nil) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;   显示时间设置   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率，单位多少来着？

(setq column-number-mode t) 
(setq line-number-mode t)
;;显示行列号

(setq mouse-yank-at-point t)
;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。我觉得先用光标定位，然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或是在 minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置。

(setq kill-ring-max 200)
;;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西

(setq show-paren-mode t) ;;打开括号匹配显示模式
(setq show-paren-style 'parenthesis)
;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。

(setq frame-title-format "emacs@%b")
;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示。

(setq auto-image-file-mode t)
;;让 Emacs 可以直接打开和显示图片。
(setq-default kill-whole-line t)
;; 在行首 C-k 时，同时删除该行。

(setq scroll-margin 3  scroll-conservatively 10000)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。

(setq make-backup-files nil) 
;; 设定不产生备份文件
(setq auto-save-mode nil) 
;;自动保存模式

(setq-default make-backup-files nil)
;; 不生成临时文件

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

(setq mouse-yank-at-point t)
;;使用鼠标中键可以粘贴

(setq user-full-name "xingjianwei")
(setq user-mail-address "xingjianwei@gmail.com")
;;设置有用的个人信息,这在很多地方有用。

(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;;设置home键指向buffer开头，end键指向buffer结尾 

(global-set-key (kbd "M-g") 'goto-line)
;;设置M-g为goto-line

(global-set-key (kbd "C-SPC") 'nil)
;;取消control+space键设为mark

(global-set-key (kbd "M-<SPC>") 'set-mark-command)
;;这样 我就不用按 C-@ 来 setmark 了, C-@ 很不好按。

;set color
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dark-blue)))
;bookmark

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


(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))
;; mew-pop-size设置成0时，pop邮件大小没有限制
(setq mew-pop-size 0)
;; 不删除服务器上的邮件
(setq mew-pop-delete nil)
(setq mew-use-cached-passwd t)
(setq user-full-name "xingjianwei")
(setq user-mail-address "xingjianwei@gmail.com")
(setq mew-cite-fields '("Date:"  "From:"))
(setq mew-cite-format "On %s %s wrote:\n\n")
(setq mew-use-biff t)  ;; 设置使用Biff检查邮箱是否有新邮件，默认为5分钟。如果有新邮件，则在emacs的状态栏显示Mail(n)的提示—n表示新邮件数目。
(setq mew-use-biff-bell t)  ;; 设置嘟嘟声通知有新邮件
(setq mew-biff-interval 5) ;; 设置自动检查新邮件的时间间隔，单位：分钟

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
