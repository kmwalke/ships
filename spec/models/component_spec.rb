require 'rails_helper'

RSpec.describe Component, type: :model do
  it { should belong_to(:ship) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:affect) }
end
