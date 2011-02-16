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

;; �ı� Emacs ��ִ��Ҫ��ش� yes ����Ϊ���� y ��ո����ʾ yes��n ��ʾ no��
(fset 'yes-or-no-p 'y-or-n-p)
(setq warning-suppress-types nil) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;   ��ʾʱ������   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(display-time-mode 1);;����ʱ����ʾ���ã���minibuffer������Ǹ�����
(setq display-time-24hr-format t);;ʱ��ʹ��24Сʱ��
(setq display-time-day-and-date t);;ʱ����ʾ�������ں;���ʱ��
(setq display-time-use-mail-icon t);;ʱ�����Ա������ʼ�����
(setq display-time-interval 10);;ʱ��ı仯Ƶ�ʣ���λ�������ţ�

(setq column-number-mode t) 
(setq line-number-mode t)
;;��ʾ���к�

(setq mouse-yank-at-point t)
;;��Ҫ����������Ǹ��ط�������������ݡ��Ҳ�ϲ���������������ҵ��ĵ����һ���㡣�Ҿ������ù�궨λ��Ȼ������м����Ҫ�õĶࡣ������Ĺ�����ĵ����Ǹ�λ�ã������� minibuffer������м�һ�����X selection �����ݾͱ����뵽�Ǹ�λ�á�

(setq kill-ring-max 200)
;;����ճ��������Ŀ����.��һ���ܴ��kill ring(���ļ�¼����). ������ֹ�Ҳ�С��ɾ����Ҫ�Ķ���

(setq show-paren-mode t) ;;������ƥ����ʾģʽ
(setq show-paren-style 'parenthesis)
;;����ƥ��ʱ���Ը�����ʾ����һ�ߵ����ţ�����겻�ᷳ�˵�������һ�����Ŵ���

(setq frame-title-format "emacs@%b")
;;�ڱ�������ʾbuffer�����֣������� emacs@wangyin.com ����û�õ���ʾ��

(setq auto-image-file-mode t)
;;�� Emacs ����ֱ�Ӵ򿪺���ʾͼƬ��
(setq-default kill-whole-line t)
;; ������ C-k ʱ��ͬʱɾ�����С�

(setq scroll-margin 3  scroll-conservatively 10000)
;;��ֹҳ�����ʱ������ scroll-margin 3 �����ڿ�����Ļ����3��ʱ�Ϳ�ʼ���������ԺܺõĿ��������ġ�

(setq make-backup-files nil) 
;; �趨�����������ļ�
(setq auto-save-mode nil) 
;;�Զ�����ģʽ

(setq-default make-backup-files nil)
;; ��������ʱ�ļ�

;;����emacs���ⲿ���������ճ��
(setq x-select-enable-clipboard t)

(setq mouse-yank-at-point t)
;;ʹ������м�����ճ��

(setq user-full-name "xingjianwei")
(setq user-mail-address "xingjianwei@gmail.com")
;;�������õĸ�����Ϣ,���ںܶ�ط����á�

(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;;����home��ָ��buffer��ͷ��end��ָ��buffer��β 

(global-set-key (kbd "M-g") 'goto-line)
;;����M-gΪgoto-line

(global-set-key (kbd "C-SPC") 'nil)
;;ȡ��control+space����Ϊmark

(global-set-key (kbd "M-<SPC>") 'set-mark-command)
;;���� �ҾͲ��ð� C-@ �� setmark ��, C-@ �ܲ��ð���

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
;;�Զ����أ��� python-mode ���ļ� python-mode.elc����
(autoload 'python-mode "python-mode" "Python editing mode." t)
(global-font-lock-mode t)  ;�﷨����
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
;; mew-pop-size���ó�0ʱ��pop�ʼ���Сû������
(setq mew-pop-size 0)
;; ��ɾ���������ϵ��ʼ�
(setq mew-pop-delete nil)
(setq mew-use-cached-passwd t)
(setq user-full-name "xingjianwei")
(setq user-mail-address "xingjianwei@gmail.com")
(setq mew-cite-fields '("Date:"  "From:"))
(setq mew-cite-format "On %s %s wrote:\n\n")
(setq mew-use-biff t)  ;; ����ʹ��Biff��������Ƿ������ʼ���Ĭ��Ϊ5���ӡ���������ʼ�������emacs��״̬����ʾMail(n)����ʾ��n��ʾ���ʼ���Ŀ��
(setq mew-use-biff-bell t)  ;; ��������֪ͨ�����ʼ�
(setq mew-biff-interval 5) ;; �����Զ�������ʼ���ʱ��������λ������

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
