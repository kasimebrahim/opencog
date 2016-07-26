(use-modules (opencog))

;-------------------------------------------------------------------------------

(define (get-word-list sent-node)
    (List
        (append-map
            (lambda (w)
                (if (not (string-prefix? "LEFT-WALL" (cog-name w)))
                    (cog-chase-link 'ReferenceLink 'WordNode w)
                    '()))
            (car (sent-get-words-in-order sent-node))))
)

(define-public (get-input-word-list)
    (gar (cog-execute! (Get (State input-utterance-words (Variable "$x")))))
)

(define-public (get-input-sent-node)
    (gar (cog-execute! (Get (State input-utterance-sentence (Variable "$x")))))
)

(define-public (get-input-text-node)
    (gar (cog-execute! (Get (State input-utterance-text (Variable "$x")))))
)

; This is generated by 'nlp-parse'
(define-public (get-input-time)
    (cog-name (gar (cog-execute! (Get (AtTime (Variable "$t")
        (get-input-sent-node) (TimeDomainNode "Dialogue-System"))))))
)