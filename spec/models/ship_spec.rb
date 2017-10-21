require 'rails_helper'

RSpec.describe Ship, type: :model do
  it { should have_many(:components).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:color) }
end
