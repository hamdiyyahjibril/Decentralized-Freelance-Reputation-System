;; Dispute Resolution Contract
;; Handles conflicts between freelancers and clients

(define-map disputes
  { dispute-id: uint }
  {
    job-id: uint,
    complainant: principal,
    respondent: principal,
    description: (string-ascii 256),
    status: (string-ascii 20),
    resolution: (optional (string-ascii 256)),
    created-at: uint,
    resolved-at: (optional uint)
  }
)

(define-data-var dispute-id-nonce uint u0)

(define-constant contract-owner tx-sender)

(define-read-only (get-dispute (dispute-id uint))
  (map-get? disputes { dispute-id: dispute-id })
)

(define-public (file-dispute (job-id uint) (respondent principal) (description (string-ascii 256)))
  (let
    (
      (new-dispute-id (+ (var-get dispute-id-nonce) u1))
    )
    (var-set dispute-id-nonce new-dispute-id)
    (ok (map-set disputes
      { dispute-id: new-dispute-id }
      {
        job-id: job-id,
        complainant: tx-sender,
        respondent: respondent,
        description: description,
        status: "open",
        resolution: none,
        created-at: block-height,
        resolved-at: none
      }
    ))
  )
)

(define-public (resolve-dispute (dispute-id uint) (resolution (string-ascii 256)))
  (let
    (
      (dispute (unwrap! (get-dispute dispute-id) (err u1)))
    )
    (asserts! (is-eq tx-sender contract-owner) (err u2))
    (asserts! (is-eq (get status dispute) "open") (err u3))
    (ok (map-set disputes
      { dispute-id: dispute-id }
      (merge dispute {
        status: "resolved",
        resolution: (some resolution),
        resolved-at: (some block-height)
      })
    ))
  )
)

