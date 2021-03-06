require 'pg'
require 'user'
require 'database_helper'

describe User do

  describe ' .create' do
    it "adds a new user" do
      user = User.create(name: 'Ngai Sui', email: 'jess@chitter.com', username: 'jess', password: 'born2chit')
      persisted_data = persisted_data(id: user.id)

      expect(user).to be_a User
      #expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Ngai Sui'
      expect(user.email).to eq 'jess@chitter.com'
      expect(user.username).to eq 'jess'
      expect(user.password).to eq 'born2chit'
    end
  end

  describe ' .all' do
    it "lists all chitters" do
      User.create(name: 'Ngai Sui', email: 'jess@chitter.com', username: 'jess', password: 'born2chit')

      users = User.all

      expect(users.length).to eq 1
      expect(users.first).to be_a User
      expect(users.first.name).to eq 'Ngai Sui'
      expect(users.first.email).to eq 'jess@chitter.com'
      expect(users.first.username).to eq 'jess'
      expect(users.first.password).to eq 'born2chit'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: 'Ngai Sui', email: 'jess@chitter.com', username: 'jess', password: 'born2chit')
      result = User.find(id: user)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(name: 'Ngai Sui', email: 'jess@chitter.com', username: 'jess', password: 'born2chit')

      authenticated_user = User.authenticate(username: 'jess', password: 'born2chit')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect username' do
      user = User.create(name: 'Ngai Sui', email: 'jess@chitter.com', username: 'jess', password: 'born2chit')

      users = User.all

      expect(User.authenticate(username: 'jesslns', password: 'born2chit')).to be_nil
    end
  end
end
