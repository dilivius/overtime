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
- x Create audit log for each text message
- How to update end_date when confirmed
- Update the audit_log status when an overtime item is rejected
- Update buttons on employee homepage to show on mobile
- Update buttons to include timespan
- Update buttons sort on employees home page / dashboard
- Remove unnecessary navbar buttons for managers
- Implement honeybadger for error reporting
- Implement new relic for keeping the site alive (Heroku puts the app to sleep - this will keep the site alive)

## UI:
- x Bootstrap -> formatting
- x Icons instead of text for Edit * Delete

# Refactor TO DOs:
- x Refactor posts/_form for admin user with status
