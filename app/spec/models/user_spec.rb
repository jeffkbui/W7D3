# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
  # validations
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
  end

  describe "associations" do
    it { should have_many(:goals) }
  end

  describe "class methods" do
    describe "::find_by_credentials" do
      it { should validate_presence_of(:username) }
      it { should validate_length_of(:password).is_at_least(6) }
    end

    describe "::generate_session_token" do
      it { should validate_presence_of(:session_token) }
    end

  end




end
