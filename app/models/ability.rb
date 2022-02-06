# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
  	#admin 権限が存在する場合
  	if user.has_any_role? :admin
  		can :manage, :all  #:manage - すべてのActionに接続許可
  		can :read, :all    #:read - listの観覧 許可
  	#loginした一般ユーザ
  	elsif user.has_any_role? :student
  		can :read, :all
  		can [:index, :show, :new, :create], Board
  		can [:edit, :update, :destroy], Board, user_id: user.id
  		can [:create], Comment
  		can [:destroy], Comment, user_id: user.id
  	# ゲスト
  	else
  		can :read, :all #:read - listの観覧 許可
  	end
  end
end
