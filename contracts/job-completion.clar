;; Job Completion Contract
;; Records successful project deliveries

(define-map completed-jobs
  { job-id: uint }
  {
    freelancer: principal,
    client: principal,
    completion-date: uint,
    job-description: (string-ascii 256)
  }
)

(define-data-var job-id-nonce uint u0)

(define-read-only (get-completed-job (job-id uint))
  (map-get? completed-jobs { job-id: job-id })
)

(define-public (record-job-completion (client principal) (job-description (string-ascii 256)))
  (let
    (
      (new-job-id (+ (var-get job-id-nonce) u1))
    )
    (var-set job-id-nonce new-job-id)
    (ok (map-set completed-jobs
      { job-id: new-job-id }
      {
        freelancer: tx-sender,
        client: client,
        completion-date: block-height,
        job-description: job-description
      }
    ))
  )
)

