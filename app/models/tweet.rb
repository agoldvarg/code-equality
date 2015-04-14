class Tweet < ActiveRecord::Base
  belongs_to  :subject
  validates  :html, uniqueness: true
end
