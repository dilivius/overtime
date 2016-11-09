# Overtime app

## Key Requirement: Company needs documentation that their employees did or did not get overtime each week

## Models
- x Post -> date:date rationale: text
- x User -> Devise
- x AdminUser -> STI
- AuditLog

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- x Admin dashboard
- x Block non-admins from accessing the Admin Dashboard
- Email summary to managers for approval
- Needs to be documented if employee did not do overtime

## UI:
- x Bootstrap -> formatting
- x Icons instead of text for Edit * Delete

# Refactor TO DOs:
- x Refactor posts/_form for admin user with status
