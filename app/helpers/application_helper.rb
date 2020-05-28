module ApplicationHelper
  def set_brand_path
    if current_user&.admin?
      admin_tests_path
    else
      root_path
    end
  end
end
