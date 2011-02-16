(setq mew-prog-ssl "e:/cygwin/bin/stunnel.exe");改为你安装的路径
(setq mew-ssl-verify-level 0)
;;(setq mew-user "xingjianwei")
;;(setq mew-mail-domain "gmail.com")
;;(setq mew-pop-user "xingjianwei@gmail.com")
(setq mew-pop-auth 'pass)
(setq mew-pop-ssl t)
;;(setq mew-pop-server "pop.gmail.com")
(setq mew-pop-ssl-port "995")
(setq mew-imap-auth  t)
(setq mew-imap-ssl t)
(setq mew-imap-ssl-port "993")
;;(setq mew-smtp-user "xingjianwei@gmail.com")
(setq mew-smtp-ssl t)
;;(setq mew-smtp-server "smtp.gmail.com")
(setq mew-smtp-ssl-port "465")

(setq mew-summary-form (quote (type (5 date) " " (14 from) " " (4 size) "  " t (90 subj) "|>  " (0 body))))




(setq mew-config-alist
      '(
        ;; Default fetch mailbox is IMAP
        (imapgmail
         (mailbox-type          imap)
         (proto                 "%")
         (imap-server           "imap.gmail.com")
         (imap-user             "xingjianwei@gmail.com")
         (name                  "xingjianwei")
         (user                  "xingjianwei")
         (mail-domain           "gmail.com")
         (imap-size             0)
         (imap-delete           t)
         (imap-queue-folder     "%queue")
         (imap-trash-folder     "%Trash") ;; This must be in concile with your IMAP box setup
    ;;     (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5")) 
         (smtp-user             "xingjianwei@gmail.com")
         (smtp-server           "smtp.gmail.com")
    	 )
         ;; news group comp.lang.c
       (usenet
        (mailbox-type         . mbox)
        (nntp-server           "news.aioe.org")
        (nntp-user             nil) ;; should be nil defaulty
        (nntp-header-only      nil)
        (nntp-newsgroup        "-comp.lang.c") ;; little '-'
        (nntp-size             0)
        (nntp-msgid-user       "User Mew")
        (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5"))
        (smtp-user             "xingjianwei@gmail.com")
        (smtp-server           "smtp.gmail.com")
	)
 
        (default
         (mailbox-type          pop)
         (pop-server            "pop.gmail.com")
         (name                  "xingjianwei")
         (user                  "xingjianwei")
         (mail-domain           "gmail.com")
         (pop-auth              pass)
         (pop-user              "xingjianwei@gmail.com")
         (smtp-user             "xingjianwei@gmail.com")
         (smtp-server           "smtp.gmail.com")
        )))


