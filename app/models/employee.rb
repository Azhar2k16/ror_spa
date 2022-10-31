class Employee < ApplicationRecord
  validates_presence_of :f_name, :l_name, :email, :phone
  validates_length_of :f_name, :l_name, maximum: 25
  validates_uniqueness_of :f_name, :l_name, :email, :phone
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
