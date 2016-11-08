# Overtime app

## Key Requirement: Company needs documentation that their employees did or did not get overtime each week

## Models
- x Post -> date:date rationale: text
- x User -> Devise
- x AdminUser -> STI

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- x Admin dashboard
- x Block non-admins from accessing the Admin Dashboard
- Email summary to managers for approval
- Needs to be documented if employee did not do overtime

## UI:
- x Bootstrap -> formatting

# Refactor TO DOs:
- Refactor user association integration test in post_spec
- Refactor posts/_form for admin user with status
- Fix post_spec.rb: 'FactoryGirl bug?'
