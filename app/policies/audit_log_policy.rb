class AuditLogPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def confirm?
    audit_log_owner?
  end

  private

  def admin?
    admin_types.include?(user.type)
  end
  def audit_log_owner?
    record.user_id == user.id
  end
end
