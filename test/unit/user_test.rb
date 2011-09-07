require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:travis)
  end

  test 'should require a name' do
    @user.name = nil
    refute @user.valid?
    refute @user.errors[:name].empty?
  end

  test 'reject names that are too long' do
    @user.name = 'a' * 51
    refute @user.valid?
    refute @user.errors[:name].empty?
  end

  test 'should require an email address' do
    @user.email = nil
    refute @user.valid?
    refute @user.errors[:email].empty?
  end

  test 'accept valid email addresses' do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      @user.email = address
      assert @user.valid?
      assert@user.errors[:email].empty?
    end
  end

  test 'reject valid email addresses' do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      @user.email = address
      refute @user.valid?
      refute @user.errors[:email].empty?
    end
  end

  test 'reject duplicate email addresses' do
    @duplicate_user = users(:travis_duped)
    @duplicate_user.email = 'traviswetmore@gmail.com'
    refute @duplicate_user.valid?, 'valid?'
    refute @duplicate_user.errors[:email].empty?, 'empty?'
  end

  test "reject email addresses identical up to case" do
    @upcase_email_user = users(:travis_duped)
    @upcase_email_user.email = 'traviswetmore@gmail.com'.upcase
    refute @upcase_email_user.valid?, 'valid?'
    refute @upcase_email_user.errors[:email].empty?, 'empty?'
  end
end

