require 'rails_helper'

describe Question do
  it { should validate_presence_of :name }
  it { should validate_presence_of :body }
  it { should validate_uniqueness_of :name }
  it { should belong_to :user }
end
