# require 'rails_helper'
# describe UserPolicy do
#   subject { described_class }
#
#   permissions :update? do
#     it "denies access if you are not an admin" do
#       user = FactoryGirl.create(:user)
#       user2 = FactoryGirl.create(:user, name: "User2", email: "user2@user.user")
#       expect(subject).not_to permit(User.new(is_admin: false), User.new(is_admin: false))
#     end
#   end
# end
