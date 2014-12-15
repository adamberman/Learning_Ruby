# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :text             not null
#  privacy     :string(255)      not null
#  status      :string(255)      not null
#  user_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :goal do
    title "Goal Title"
    description "Goal Description"
  end
end
