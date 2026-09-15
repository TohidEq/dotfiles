;;; email.el -*- lexical-binding: t; -*-

;; ======================================================================================= ;;
;;
;; DO THESE:
;;
;; APP PASSWORD  ?      -> https://support.google.com/accounts/answer/185833
;;
;; CREATE APP PASSWORD  -> https://myaccount.google.com/apppasswords
;;
;; go to a random path and put passes into two files like:
;;       /path/to/.mbsyncpass-acc1
;;       /path/to/.mbsyncpass-acc2
;;
;; then go to their paths and run :
;; >> $ gpg2 -c .mbsyncpass-acc1
;; >> $ gpg2 -c .mbsyncpass-acc2
;;
;; it will create 2 files like
;;       /path/to/.mbsyncpass-acc1.gpg
;;       /path/to/.mbsyncpass-acc2.gpg
;; then remove your (.mbsyncpass-acc1) and (.mbsyncpass-acc2) files
;;
;; -- > > > undo? : >> $ gpg2 -d .mybsyncpass-acc1.gpg>raw_pass.txt
;;
;; --------------------------------------------------------------------------------------- ;;
;;
;; >> $ mbsync -c ~/path/to/.mbsyncrc -a -V
;;                                      (-V):see what's going on
;; >> $ mu init --maildir /path/to/maildir/mail
;; >> $ mu index --lazy-check
;;
;; ======================================================================================= ;;
;;
;;  TO SEND MAILS -> CREATE (~/.authinfo.gpg) FILE
;;  ~/.authinfo.gpg FILE CONTENT (2 lines for 2 accs):
;;
;;  machine smtp.gmail.com port 587 login Acc1@gmail.com password "App Password acc 1"
;;  machine smtp.gmail.com port 587 login Acc2@gmail.com password "App Password acc 2"
;;
;;
;; ======================================================================================= ;;


(use-package! mu4e
  :commands mu4e
  :config
  ;; Maildir root (where mbsync puts emails)
  (setq mu4e-root-maildir "~/path/to/mail")
  ;; Use mbsync with your specific config
  (setq mu4e-get-mail-command "mbsync -c ~/path/to/.mbsyncrc -a")
  ;; Automatically pick the first context if multiple (optional)
  (setq mu4e-context-policy 'pick-first)

  ;; Define contexts for two accounts
  (setq mu4e-contexts
        `(,(make-mu4e-context
             :name "Account1"
             :match-func (lambda (msg)
                           (when msg
                             (string-prefix-p "/account1" (mu4e-message-field msg :maildir))))
             :vars '((user-mail-address      . "account1@gmail.com")
                     (user-full-name        . "Account One")
                     (mu4e-sent-folder      . "/account1/[account1].Sent")
                     (mu4e-drafts-folder    . "/account1/[account1].Drafts")
                     (mu4e-trash-folder     . "/account1/[account1].Trash")
                     (mu4e-refile-folder    . "/account1/[account1].All Mail")
                     (smtpmail-smtp-server  . "smtp.gmail.com")
                     (smtpmail-smtp-service . 587)
                     (smtpmail-stream-type  . starttls)))

          ,(make-mu4e-context
             :name "Account2"
             :match-func (lambda (msg)
                           (when msg
                             (string-prefix-p "/account2" (mu4e-message-field msg :maildir))))
             :vars '((user-mail-address      . "account2@gmail.com")
                     (user-full-name        . "Account Two")
                     (mu4e-sent-folder      . "/account2/[account2].Sent")
                     (mu4e-drafts-folder    . "/account2/[account2].Drafts")
                     (mu4e-trash-folder     . "/account2/[account2].Trash")
                     (mu4e-refile-folder    . "/account2/[account2].All Mail")
                     (smtpmail-smtp-server  . "smtp.gmail.com")
                     (smtpmail-smtp-service . 587)
                     (smtpmail-stream-type  . starttls))))))


(setq message-send-mail-function 'message-smtpmail-send-it
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-stream-type 'starttls
      smtpmail-auth-supported '(login plain)
      smtpmail-debug-info nil
      smtpmail-debug-verbose nil)







;; Keybinding to open mu4e quickly
(map! :leader
      :desc "Open Mail (mu4e)"
      "o m" #'mu4e)
