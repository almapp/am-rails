# == Schema Information
#
# Table name: groups_admins
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  group_id    :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  appointment :string(255)      default(""), not null
#

require 'test_helper'

class GroupsAdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
