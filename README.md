# Overtime app

## Key Requirement: Company needs documentation that their employees did or did not get overtime each week

## Models
- x Post -> date:date rationale: text
- x User -> Devise
- x AdminUser -> STI
- x AuditLog

## Features:
- x Approval Workflow
- x SMS Sending -> link to approval or overtime input -> integrate with Heroku scheduler
- x Admin dashboard
- x Block non-admins from accessing the Admin Dashboard
- x Email summary to managers for approval
- x Needs to be documented if employee did not do overtime
- Create audit log for each text message

## UI:
- x Bootstrap -> formatting
- x Icons instead of text for Edit * Delete

# Refactor TO DOs:
- x Refactor posts/_form for admin user with status
