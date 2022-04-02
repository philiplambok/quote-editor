class User < ApplicationRecord
  @current_user = nil

  class << self
    attr_writer :current_user
  end

  def self.current_user
    @user
  end

  has_many :notes
end
