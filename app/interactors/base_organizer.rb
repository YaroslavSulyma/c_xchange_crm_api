class BaseOrganizer
  include Interactor::Organizer

  def call
    ActiveRecord::Base.transaction { super }
  end
end
