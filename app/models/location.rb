class Location < ActiveRecord::Base
  extend FriendlyId

  friendly_id :to_s, use: :slugged

  has_many :statuses
  has_many :users, through: :statuses

  def self.geocode(raw)
    if geo = Geocoder.search(raw).first
      self.find_or_create_by(city: geo.city, state: geo.state_code, country: geo.country_code)
    end
  end

  def to_s
    [city, state, country].join(' ')
  end
end
