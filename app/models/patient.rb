class Patient < ApplicationRecord
  has_many :vaccinations, dependent: :destroy
  before_save :my_method
  validates :run, uniqueness: true
  validates :name, :last_name, :birth_date, :run, presence: true
  validates :name, :last_name, length: { minimum: 2 }
  validates :run, format: { with: /\d{1,3}(?:\d{1,3}){2}-[\dkK]/, message: 'invalid, please use dots and hyphen, example: 12.345.678-k' }
  validate :under_age_cannot_be_vaccinated
  
  def under_age_cannot_be_vaccinated
    if birth_date.present? && birth_date > 12.years.ago
      errors.add(:birth_date, 'No under 12 years old can be vaccinated')
    end
  end

  def my_method
    p "this method runs before save for patient #{name}"
  end

  def full_name
    "#{name} #{last_name}"
  end

  def age
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end
