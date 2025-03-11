;; Skill Verification Contract
;; Validates freelancer abilities through tests or peer reviews

(define-map freelancer-skills
  { freelancer: principal }
  { skills: (list 10 (string-ascii 20)) }
)

(define-map skill-verifications
  { freelancer: principal, skill: (string-ascii 20) }
  {
    verified-by: principal,
    verification-date: uint,
    score: uint
  }
)

(define-read-only (get-freelancer-skills (freelancer principal))
  (default-to { skills: (list) } (map-get? freelancer-skills { freelancer: freelancer }))
)

(define-read-only (get-skill-verification (freelancer principal) (skill (string-ascii 20)))
  (map-get? skill-verifications { freelancer: freelancer, skill: skill })
)

(define-public (add-skill (skill (string-ascii 20)))
  (let
    (
      (current-skills (get skills (get-freelancer-skills tx-sender)))
    )
    (asserts! (< (len current-skills) u10) (err u1)) ;; Max 10 skills
    (asserts! (is-none (index-of current-skills skill)) (err u2)) ;; Skill not already added
    (ok (map-set freelancer-skills
      { freelancer: tx-sender }
      { skills: (unwrap! (as-max-len? (append current-skills skill) u10) (err u3)) }
    ))
  )
)

(define-public (verify-skill (freelancer principal) (skill (string-ascii 20)) (score uint))
  (let
    (
      (freelancer-skill-list (get skills (get-freelancer-skills freelancer)))
    )
    (asserts! (>= score u0) (err u4))
    (asserts! (<= score u100) (err u5))
    (asserts! (is-some (index-of freelancer-skill-list skill)) (err u6))
    (ok (map-set skill-verifications
      { freelancer: freelancer, skill: skill }
      {
        verified-by: tx-sender,
        verification-date: block-height,
        score: score
      }
    ))
  )
)

