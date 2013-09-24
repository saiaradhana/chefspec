require 'chefspec'

describe 'remote_file::create' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'creates a remote_file with the default action' do
    expect(chef_run).to create_remote_file('/tmp/default_action')
  end

  it 'creates a remote_file with an explicit action' do
    expect(chef_run).to create_remote_file('/tmp/explicit_action')
  end

  it 'creates a remote_file with attributes' do
    expect(chef_run).to create_remote_file('/tmp/with_attributes').with(owner: 'owner')
  end

  it 'creates a remote_file when specifying the identity attribute' do
    expect(chef_run).to create_remote_file('/tmp/identity_attribute')
  end
end