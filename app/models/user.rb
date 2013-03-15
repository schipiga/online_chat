require 'digest/md5'

class User < ActiveRecord::Base
  attr_accessor :password

  attr_protected :encrypted_password

  validates :password, confirmation: true

  before_create :encrypt_password

  def self.login params
    user = find_by_email params[:email]
    if user
      if user.valid_password? params[:password]
        redis.set user.id, user.email unless redis.exists user.id
      end
    end
  end

  def self.online
    redis.keys.map do |key|
      { id: key, name: redis.get(key) }
    end
  end

  def logout
    redis.del id
  end

  protected

  def valid_password? password
    encrypted_password == Digest::MD5.hexdigest password
  end

  def encrypt_password
    encrypted_password = Digest::MD5.hexdigest password
  end

  def self.redis
    @redis ||= Redis.new
  end

  def redis
    @redis ||= Redis.new
  end
end
