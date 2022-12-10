# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable, :trackable

  belongs_to :person

  # TODO: recreate this
  attribute :first_name
  attribute :last_name

  after_initialize :create_associated_person, unless: :person_created?
  def create_associated_person
    return if person

    create_person(first_name:, last_name:)
  end

  def person_created?
    person.present?
  end
end
