require 'spec_helper'

describe Event, type: :model do
  it { is_expected.to belong_to(:player) }
end
