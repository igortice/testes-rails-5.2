class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    @user.roles.each { |role| send(role.to_sym) }
  end

  def user
    can [:crud], Post, user: @user
  end

  def admin
    user
  end
end
