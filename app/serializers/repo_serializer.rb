class RepoSerializer < ActiveModel::Serializer
  attributes(
    :admin,
    :active,
    :full_github_name,
    :full_plan_name,
    :github_id,
    :id,
    :in_organization,
    :owner_name,
    :price_in_cents,
    :private,
    :stripe_subscription_id,
  )

  def price_in_cents
    object.plan_price * 100
  end

  def full_plan_name
    "#{object.plan_type} repo".titleize
  end

  def admin
    object.memberships.find_by(user_id: current_user.id).admin?
  end

  def owner_name
    object.owner.name
  end
end
