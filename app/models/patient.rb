class Patient < ApplicationRecord
  def full_name
    "#{name} #{last_name}"
  end
end
