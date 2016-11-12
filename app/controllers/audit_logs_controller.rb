class AuditLogsController < ApplicationController
  def index
    # @audit_logs = AuditLog.audit_log_by current_user
    # @audit_logs = current_user.audit_logs.order("id ASC")
    @audit_logs = AuditLog.page(params[:page]).per(10)
    authorize @audit_logs
  end

end
