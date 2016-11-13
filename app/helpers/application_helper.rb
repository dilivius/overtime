module ApplicationHelper
  def admin_types
    ['AdminUser', 'SuperAdmin']
  end

  def status_label(status)
    status_span_generator(status)
  end

  private
  def status_span_generator(status)
    case status
    when 'submitted'
      content_tag(:span, status.titleize, class: 'label label-primary')
    when 'approved'
      content_tag(:span, status.titleize, class: 'label label-success')
    when 'rejected'
      content_tag(:span, status.titleize, class: 'label label-danger')
    when 'pending'
      content_tag(:span, status.titleize, class: 'label label-primary')
    when 'confirmed'
      content_tag(:span, status.titleize, class: 'label label-success')
    end
  end

  def active_path?(path)
    "active" if current_page?(path)
  end
end
