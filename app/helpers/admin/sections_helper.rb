module Admin::SectionsHelper
  def safe(str)
    if str.present?
      str.html_safe
    end
  end
end
