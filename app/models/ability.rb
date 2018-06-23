class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    @user.roles.each { |role| role.to_sym }
  end

  def user
  end

  def admin
  end
end
