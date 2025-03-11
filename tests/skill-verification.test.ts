
import { describe, expect, it } from "vitest";

const accounts = simnet.getAccounts();
const address1 = accounts.get("wallet_1")!;

/*
  The test below is an example. To learn more, read the testing documentation here:
  https://docs.hiro.so/stacks/clarinet-js-sdk
*/

describe("example tests", () => {
  it("ensures simnet is well initalised", () => {
    expect(simnet.blockHeight).toBeDefined();
  });

  // it("shows an example", () => {
  //   const { result } = simnet.import { describe, it, expect, beforeEach } from "vitest"
  //
  // describe("Skill Verification Contract", () => {
  //   beforeEach(() => {
  //     // Setup test environment
  //   })
  //
  //   it("should add a skill for a freelancer", () => {
  //     const freelancer = "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM"
  //     const skill = "javascript"
  //
  //     // Simulated contract call
  //     const result = { success: true }
  //
  //     expect(result.success).toBe(true)
  //
  //     // Simulated skill retrieval
  //     const freelancerSkills = { skills: ["javascript"] }
  //
  //     expect(freelancerSkills.skills).toContain(skill)
  //   })
  //
  //   it("should verify a skill for a freelancer", () => {
  //     const freelancer = "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM"
  //     const verifier = "ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG"
  //     const skill = "javascript"
  //     const score = 85
  //
  //     // Simulated contract call
  //     const result = { success: true }
  //
  //     expect(result.success).toBe(true)
  //
  //     // Simulated verification retrieval
  //     const verification = {
  //       verifiedBy: verifier,
  //       verificationDate: 100,
  //       score: score,
  //     }
  //
  //     expect(verification.score).toBe(score)
  //   })
  //
  //   it("should not add a duplicate skill", () => {
  //     const freelancer = "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM"
  //     const skill = "javascript"
  //
  //     // Simulated contract call (second attempt to add the same skill)
  //     const result = { success: false, error: 2 }
  //
  //     expect(result.success).toBe(false)
  //     expect(result.error).toBe(2)
  //   })
  //
  //   it("should not add more than 10 skills", () => {
  //     const freelancer = "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM"
  //     const skill = "eleventh-skill"
  //
  //     // Simulated contract call (attempt to add 11th skill)
  //     const result = { success: false, error: 1 }
  //
  //     expect(result.success).toBe(false)
  //     expect(result.error).toBe(1)
  //   })
  //
  //   it("should not verify a non-existent skill", () => {
  //     const freelancer = "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM"
  //     const skill = "nonexistent-skill"
  //     const score = 85
  //
  //     // Simulated contract call
  //     const result = { success: false, error: 6 }
  //
  //     expect(result.success).toBe(false)
  //     expect(result.error).toBe(6)
  //   })
  // })callReadOnlyFn("counter", "get-counter", [], address1);
  //   expect(result).toBeUint(0);
  // });
});
